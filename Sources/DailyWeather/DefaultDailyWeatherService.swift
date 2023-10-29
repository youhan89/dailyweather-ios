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

public final class DefaultDailyWeatherService: NSObject, DailyWeatherService  {
    
    private let locationManager = CLLocationManager()
    private let weatherKit = WeatherService.shared
    
    private var locationPermissionContinuation: CheckedContinuation<(), Error>? = nil
    private var locationContinuation: CheckedContinuation<CLLocation, Error>? = nil
    
    private var cachedForecast: [DailyForecast] = []
    private var cachedLocation: CLLocation? = nil
    
    public override init() {
        super.init()
        
        locationManager.delegate = self
    }
    
    public func locationPermission() -> CLAuthorizationStatus {
        locationManager.authorizationStatus
    }
    
    public func requestLocationPermission() async throws {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            Logger.weatherHandler.info("Location permission requested]")
            try await withCheckedThrowingContinuation { continuation in
                locationPermissionContinuation = continuation
                locationManager.requestWhenInUseAuthorization()
            }
            
        case .authorizedAlways, .authorizedWhenInUse:
            Logger.weatherHandler.debug("Location permission already granted]")
            return
            
        default:
            Logger.weatherHandler.error("Location permission denied [status: \(String(describing: self.locationManager.authorizationStatus))]")
            throw DailyWeatherServiceError.permissionDenied
        }
    }
    
    public func updateLocation() async throws -> CLLocation {
        if let cachedLocation {
            Logger.weatherHandler.info("UpdateLocation() returning cached forecast]")
            return cachedLocation
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            locationContinuation = continuation
            locationManager.requestLocation()
        }
    }
    
    public func updateWeather(forLocation location: CLLocation) async throws -> [DailyForecast] {
        guard cachedForecast.isEmpty else {
            Logger.weatherHandler.info("UpdateWeather() returning cached forecast]")
            return cachedForecast
        }
        
        do {
            cachedForecast = try await weatherKit.weather(for: location).dailyForecast.map { .from($0) }
            return cachedForecast
        } catch {
            Logger.weatherHandler.error("WeatherKit.get failed [error: \(String(describing: error))]")
            throw error
        }
    }
}

extension DefaultDailyWeatherService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Logger.weatherHandler.error("LocationManager failed with error \(String(describing: error))]")
    }
    
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard let locationPermissionContinuation else {
            return
        }
        
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationPermissionContinuation.resume(returning: ())
        default:
            locationPermissionContinuation.resume(throwing: DailyWeatherServiceError.permissionDenied)
            
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationContinuation else {
            Logger.weatherHandler.error("Received unexpected location]")
            return
        }
        
        guard let location = locations.last else {
            locationContinuation.resume(throwing: DailyWeatherServiceError.unknownLocation)
            return
        }
        
        locationContinuation.resume(returning: location)
    }
}
