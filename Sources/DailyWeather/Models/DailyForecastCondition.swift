//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-11-10.
//

import Foundation
import WeatherKit

public enum DailyForecastCondition {
    case blizzard
    case blowingDust
    case blowingSnow
    case breezy
    case clear
    case cloudy
    case drizzle
    case flurries
    case foggy
    case freezingDrizzle
    case freezingRain
    case frigid
    case hail
    case haze
    case heavyRain
    case heavySnow
    case hot
    case hurricane
    case isolatedThunderstorms
    case mostlyClear
    case mostlyCloudy
    case partlyCloudy
    case rain
    case scatteredThunderstorms
    case sleet
    case smoky
    case snow
    case strongStorms
    case sunFlurries
    case sunShowers
    case thunderstorms
    case tropicalStorm
    case windy
    case wintryMix
    case unknown
}

extension DailyForecastCondition {
    static func from(_ weatherKit: WeatherKit.WeatherCondition) -> DailyForecastCondition {
        switch weatherKit {
        case .blizzard:
                .blizzard
        case .blowingDust:
                .blowingDust
        case .blowingSnow:
                .blowingSnow
        case .breezy:
                .breezy
        case .clear:
                .clear
        case .cloudy:
                .cloudy
        case .drizzle:
                .drizzle
        case .flurries:
                .flurries
        case .foggy:
                .foggy
        case .freezingDrizzle:
                .freezingDrizzle
        case .freezingRain:
                .freezingRain
        case .frigid:
                .frigid
        case .hail:
                .hail
        case .haze:
                .haze
        case .heavyRain:
                .heavyRain
        case .heavySnow:
                .heavySnow
        case .hot:
                .hot
        case .hurricane:
                .hurricane
        case .isolatedThunderstorms:
                .isolatedThunderstorms
        case .mostlyClear:
                .mostlyClear
        case .mostlyCloudy:
                .mostlyCloudy
        case .partlyCloudy:
                .partlyCloudy
        case .rain:
                .rain
        case .scatteredThunderstorms:
                .scatteredThunderstorms
        case .sleet:
                .sleet
        case .smoky:
                .smoky
        case .snow:
                .snow
        case .strongStorms:
                .strongStorms
        case .sunFlurries:
                .sunFlurries
        case .sunShowers:
                .sunShowers
        case .thunderstorms:
                .thunderstorms
        case .tropicalStorm:
                .tropicalStorm
        case .windy:
                .windy
        case .wintryMix:
                .wintryMix
        @unknown default:
                .unknown
        }
    }
}
