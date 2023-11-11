//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-11-11.
//

import Foundation
import WeatherKit

public struct DailyHourForecast {
    public let apparentTemperature: Measurement<UnitTemperature>
    public let humidity: Double
    public let temperature: Measurement<UnitTemperature>
    public let dewPoint: Measurement<UnitTemperature>
    public let pressure: Measurement<UnitPressure>
    public let pressureTrend: DailyPressureTrend
    public let cloudCover: Double
    public let condition: DailyForecastCondition
    public let isDaylight: Bool
    public let visibility: Measurement<UnitLength>
    public let uvIndex: DailyUVIndex
    public let wind: DailyWind
    public let date: Date
    public let precipitation: PrecipitationType
    public let precipitationChance: Double
    public let sfSymbol: String
}

public extension DailyHourForecast {
    static func from(_ weatherKit: WeatherKit.HourWeather) -> DailyHourForecast {
        DailyHourForecast(
            apparentTemperature: weatherKit.apparentTemperature,
            humidity: weatherKit.humidity,
            temperature: weatherKit.temperature,
            dewPoint: weatherKit.dewPoint,
            pressure: weatherKit.pressure,
            pressureTrend: .from(weatherKit.pressureTrend),
            cloudCover: weatherKit.cloudCover,
            condition: .from(weatherKit.condition),
            isDaylight: weatherKit.isDaylight,
            visibility: weatherKit.visibility,
            uvIndex: .from(weatherKit.uvIndex),
            wind: .from(weatherKit.wind),
            date: weatherKit.date,
            precipitation: .from(weatherKit.precipitation),
            precipitationChance: weatherKit.precipitationChance,
            sfSymbol: weatherKit.symbolName
        )
    }
    
    static func stub() -> DailyHourForecast {
        DailyHourForecast(
            apparentTemperature: .init(value: 20.0, unit: .celsius),
            humidity: 0.5,
            temperature: .init(value: 18.0, unit: .celsius),
            dewPoint: .init(value: 10.0, unit: .celsius),
            pressure: .init(value: 55, unit: .bars),
            pressureTrend: .falling,
            cloudCover: 0.5,
            condition: .breezy,
            isDaylight: true,
            visibility: .init(value: 10.0, unit: .meters),
            uvIndex: .stub(),
            wind: .stubNormal(),
            date: .now,
            precipitation: .rain,
            precipitationChance: 0.5,
            sfSymbol: "cloud.sun.fill"
        )
    }
}


public enum DailyPressureTrend {
    case falling
    case rising
    case steady
    case unknown
}

public extension DailyPressureTrend {
    static func from(_ weatherKit: WeatherKit.PressureTrend) -> DailyPressureTrend {
        switch weatherKit {
        case .rising: .rising
        case .falling: .falling
        case .steady: .steady
        default: .unknown
        }
    }
}
