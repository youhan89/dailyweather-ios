//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-27.
//

import Foundation
import WeatherKit

public struct DailySun {
    public let sunrise: Date
    public let sunset: Date
}

public extension DailySun {
    static func from(_ weatherKit: WeatherKit.SunEvents) -> DailySun? {
        guard let sunrise = weatherKit.sunrise, let sunset = weatherKit.sunset else { return nil }
        
        return DailySun(
            sunrise: sunrise,
            sunset: sunset
        )
    }
}
