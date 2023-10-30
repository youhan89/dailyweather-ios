//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-29.
//

import CoreLocation
import Foundation
import OSLog

public class MockedDailyWeatherService: DailyWeatherService {
    public init() {}
    
    public func requestLocationPermission(always: Bool) async throws -> CLAuthorizationStatus{
        return .authorizedAlways
    }
    
    public func locationPermission() -> CLAuthorizationStatus {
        .authorizedAlways
    }
    
    public func updateLocation() async throws -> CLLocation {
        Logger.weatherHandler.debug("DailyWeatherService returning mocked location")
        return CLLocation(latitude: 37.3346, longitude: 122.0090) // Apple Park, Cupertino
    }
    
    public func updateWeather(forLocation location: CLLocation) async throws -> [DailyForecast] {
        Logger.weatherHandler.debug("DailyWeatherService returning mocked forecast")
        return [ .stubSunnyDay(), .stubRainyDay(), .stubSnowDay() ]
    }
}
