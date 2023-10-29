//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-29.
//

import Foundation


public extension DailyForecast {
    static func stubRainyDay() -> DailyForecast {
        DailyForecast(
            date: Date(),
            highTemperature: Measurement(value: 20.0, unit: .celsius),
            lowTemperature: Measurement(value: 10.0, unit: .celsius),
            sfSymbol: "cloud.rain.fill",
            wind: .stubLow(),
            description: "Light rain",
            precipitation: .stubLightRain(),
            moon: .stub(),
            sun: .stub()
        )
    }
    
    static func stubSunnyDay() -> DailyForecast {
        DailyForecast(
            date: Date(),
            highTemperature: Measurement(value: 30.0, unit: .celsius),
            lowTemperature: Measurement(value: 25.0, unit: .celsius),
            sfSymbol: "sun.max",
            wind: .stubLow(),
            description: "Sun",
            precipitation: .stubNoRain(),
            moon: .stub(),
            sun: .stub()
        )
    }
    
    static func stubSnowDay() -> DailyForecast {
        DailyForecast(
            date: Date(),
            highTemperature: Measurement(value: 0.0, unit: .celsius),
            lowTemperature: Measurement(value: -5.0, unit: .celsius),
            sfSymbol: "cloud.snow",
            wind: .stubLow(),
            description: "Snow",
            precipitation: .stubLightSnow(),
            moon: .stub(),
            sun: .stub()
        )
    }
}
