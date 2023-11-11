//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-24.
//

import Foundation
import SwiftData
import WeatherKit

@Observable
public final class DailyForecast: Identifiable {
    public var id: String { ISO8601DateFormatter().string(from: date) }
    
    public let date: Date
    public let highTemperature: Measurement<UnitTemperature>
    public let lowTemperature: Measurement<UnitTemperature>
    public let sfSymbol: String
    public let wind: DailyWind
    public let description: String
    public let precipitation: DailyPrecipitation
    public let moon: DailyMoon?
    public let sun: DailySun?
    public let attribution: DailyWeatherAttribution
    public let uvIndex: DailyUVIndex
    public let condition: DailyForecastCondition
    public let hourForecast: [DailyHourForecast]
    
    public init(
        date: Date,
        highTemperature: Measurement<UnitTemperature>,
        lowTemperature: Measurement<UnitTemperature>,
        sfSymbol: String,
        wind: DailyWind,
        description: String,
        precipitation: DailyPrecipitation,
        moon: DailyMoon?,
        sun: DailySun?,
        attribution: DailyWeatherAttribution,
        uvIndex: DailyUVIndex,
        condition: DailyForecastCondition,
        hourForecast: [DailyHourForecast]
    ) {
        self.date = date
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
        self.sfSymbol = sfSymbol
        self.wind = wind
        self.description = description
        self.precipitation = precipitation
        self.moon = moon
        self.sun = sun
        self.attribution = attribution
        self.uvIndex = uvIndex
        self.condition = condition
        self.hourForecast = hourForecast
    }
}

public extension DailyForecast {
    var weekday: String {
        DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: date) - 1]
    }
    
    var dateFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }
    
    var highTemperatureFormatted: String { highTemperature.formatted() }
    var lowTemperatureFormatted: String { lowTemperature.formatted() }
}

extension DailyForecast: Hashable {
    public static func == (lhs: DailyForecast, rhs: DailyForecast) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}

public extension DailyForecast {
    static func from(_ weatherKit: WeatherKit.DayWeather, hourlyWeather: [WeatherKit.HourWeather], attribution: WeatherAttribution) -> DailyForecast {
        DailyForecast(
            date: weatherKit.date,
            highTemperature: weatherKit.highTemperature,
            lowTemperature: weatherKit.lowTemperature,
            sfSymbol: weatherKit.symbolName,
            wind: .from(weatherKit.wind),
            description: weatherKit.condition.description,
            precipitation: .from(weatherKit),
            moon: .from(weatherKit.moon),
            sun: .from(weatherKit.sun),
            attribution: .from(attribution),
            uvIndex: .from(weatherKit.uvIndex),
            condition: .from(weatherKit.condition),
            hourForecast: hourlyWeather.map { DailyHourForecast.from($0) }
        )
    }
}
