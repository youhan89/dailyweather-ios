//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-27.
//

import Foundation
import WeatherKit

public struct DailySun {
    public let sunrise, sunset: Date
    
    public let nauticalSunrise, nauticalSunset: Date
    
    public let astronomicalSunrise, astronomicalSunset: Date
    
    public let civilSunrise, civilSunset: Date
    
    public let solarMidnight, solarNoon: Date
}

public extension DailySun {
    static func from(_ weatherKit: WeatherKit.SunEvents) -> DailySun? {
        guard let sunrise = weatherKit.sunrise,
                let sunset = weatherKit.sunset,
              let nauticalSunrise = weatherKit.nauticalDawn,
              let nauticalSunset = weatherKit.nauticalDusk,
              let astronomicalSunrise = weatherKit.astronomicalDawn,
              let astronomicalSunset = weatherKit.astronomicalDusk,
              let civilSunrise = weatherKit.civilDawn,
              let civilSunset = weatherKit.civilDusk,
              let solarMidnight = weatherKit.solarMidnight,
              let solarNoon = weatherKit.solarNoon
        else { return nil }
        return DailySun(
            sunrise: sunrise,
            sunset: sunset,
            nauticalSunrise: nauticalSunrise,
            nauticalSunset: nauticalSunset,
            astronomicalSunrise: astronomicalSunrise,
            astronomicalSunset: astronomicalSunset,
            civilSunrise: civilSunrise,
            civilSunset: civilSunset,
            solarMidnight: solarMidnight,
            solarNoon: solarNoon
        )
    }
}
