//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-29.
//

import CoreLocation
import Foundation

public protocol DailyWeatherService {
    func requestLocationPermission(always: Bool) async throws -> CLAuthorizationStatus
    func updateLocation() async throws -> CLLocation
    func updateWeather(forLocation location: CLLocation) async throws -> [DailyForecast]
    func locationPermission() -> CLAuthorizationStatus
    func resetCache()
}
