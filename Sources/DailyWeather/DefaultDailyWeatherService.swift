//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-29.
//

import CoreLocation
import Foundation
import OSLog
import WeatherKit

public struct WeatherCache {
    var date: Date
    var location: CLLocation?
    var data: [DailyForecast]
}

public final class DefaultDailyWeatherService: NSObject, DailyWeatherService  {
    
    var cacheTTL: Double = 1800.0
    
    private let locationManager = CLLocationManager()
    private let weatherKit = WeatherService.shared
    
    private var locationPermissionContinuation: CheckedContinuation<CLAuthorizationStatus, Error>? = nil
    private var locationContinuation: CheckedContinuation<CLLocation, Error>? = nil
    
    private var cache: WeatherCache = WeatherCache(date: Date(), location: nil, data: [])
    
    private var cachedForecast: [DailyForecast] = []
    private var cachedLocation: CLLocation? = nil
    
    public override init() {
        super.init()
        
        locationManager.delegate = self
    }
    
    public func locationPermission() -> CLAuthorizationStatus {
        locationManager.authorizationStatus
    }
    
    public func requestLocationPermission(always: Bool = false) async throws -> CLAuthorizationStatus {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            Logger.weatherHandler.info("Location permission requested [always: \(always)]")
            return try await withCheckedThrowingContinuation { continuation in
                locationPermissionContinuation = continuation
                if always {
                    locationManager.requestAlwaysAuthorization()
                } else {
                    locationManager.requestWhenInUseAuthorization()
                }
            }
            
        case .authorizedAlways, .authorizedWhenInUse:
            Logger.weatherHandler.debug("Location permission already granted]")
            return locationManager.authorizationStatus
            
        default:
            Logger.weatherHandler.error("Location permission denied [status: \(String(describing: self.locationManager.authorizationStatus))]")
            throw DailyWeatherServiceError.permissionDenied
        }
    }
    
    public func updateLocation() async throws -> CLLocation {
        return try await withCheckedThrowingContinuation { continuation in
            locationContinuation = continuation
            locationManager.requestLocation()
        }
    }
    
    public func resetCache() {
        cache.data = []
        cache.location = nil
    }
    
    public func updateWeather(forLocation location: CLLocation) async throws -> [DailyForecast] {
        if cache.location == location && cache.date.timeIntervalSinceNow < cacheTTL && !cache.data.isEmpty {
            Logger.weatherHandler.info("UpdateWeather() returning cached forecast]")
            return cachedForecast
        }
        
        do {
            let attribution = try await weatherKit.attribution
            let weather = try await weatherKit.weather(for: location)
            
            var dailyWeatherList: [DailyForecast] = []
            
            weather.dailyForecast.forEach { dayWeather in
                let hours = weather.hourlyForecast.filter { $0.date == dayWeather.date }
                dailyWeatherList.append(.from(dayWeather, hourlyWeather: hours, attribution: attribution))
            }
            
            cache.date = Date()
            cache.data = dailyWeatherList
            cache.location = location
            
            return dailyWeatherList
        } catch {
            Logger.weatherHandler.error("WeatherKit.get failed [error: \(String(describing: error))]")
            throw error
        }
    }
}

extension DefaultDailyWeatherService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Logger.weatherHandler.error("LocationManager failed with error \(String(describing: error))]")
        if let locationContinuation {
            defer {
                self.locationContinuation = nil
            }
            
            locationContinuation.resume(throwing: error)
        }
        
        if let locationPermissionContinuation {
            defer {
                self.locationPermissionContinuation = nil
            }
            
            locationPermissionContinuation.resume(throwing: error)
        }
    }
    
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard let locationPermissionContinuation else {
            return
        }
        
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            defer {
                self.locationPermissionContinuation = nil
            }
            locationPermissionContinuation.resume(returning: manager.authorizationStatus)
        default:
            defer {
                self.locationPermissionContinuation = nil
            }
            locationPermissionContinuation.resume(throwing: DailyWeatherServiceError.permissionDenied)
            
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationContinuation else {
            Logger.weatherHandler.error("Received unexpected location]")
            return
        }
        
        guard let location = locations.last else {
            defer {
                self.locationContinuation = nil
            }
            locationContinuation.resume(throwing: DailyWeatherServiceError.unknownLocation)
            return
        }
        
        defer {
            self.locationContinuation = nil
        }
        locationContinuation.resume(returning: location)
    }
}
