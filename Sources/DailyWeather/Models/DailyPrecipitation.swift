//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-27.
//

import Foundation
import WeatherKit

public enum PrecipitationType {
    case hail
    case mixed
    case rain
    case sleet
    case snow
    case none
}

public struct DailyPrecipitation {
    public let rainfallAmount: Measurement<UnitLength>
    public let snowfallAmount: Measurement<UnitLength>
    public let chance: Double
    public let type: PrecipitationType
}

public extension DailyPrecipitation {
    var rainfallFormatted: String {
        rainfallAmount.formatted(.measurement(width: .abbreviated, usage: .rainfall))
    }
    
    var snowfallFormatted: String {
        snowfallAmount.formatted(.measurement(width: .abbreviated, usage: .rainfall))
    }
}

public extension DailyPrecipitation {
    static func from(_ weatherKit: DayWeather) -> DailyPrecipitation {
        DailyPrecipitation(
            rainfallAmount: weatherKit.precipitationAmount,
            snowfallAmount: weatherKit.snowfallAmount,
            chance: weatherKit.precipitationChance,
            type: .from(weatherKit.precipitation)
        )
    }
}

extension PrecipitationType {
    static func from(_ weatherKit: Precipitation) -> PrecipitationType {
        switch weatherKit {
        case .none: .none
        case .hail: .hail
        case .mixed: .mixed
        case .rain: .rain
        case .sleet: .sleet
        case .snow: .snow
        default: .none
        }
    }
}
