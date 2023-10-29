//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-27.
//

import Foundation
import WeatherKit

public struct DailyMoon {
    let moonrise: Date
    let moonset: Date
    let moonPhase: DailyMoonPhase
}

public extension DailyMoon {
    static func from(_ weatherKit: MoonEvents) -> DailyMoon? {
        guard let moonrise = weatherKit.moonrise, let moonset = weatherKit.moonset else { return nil }
        
        return DailyMoon(
            moonrise: moonrise,
            moonset: moonset,
            moonPhase: .from(weatherKit.phase)
        )
    }
    
}

public enum DailyMoonPhase {
    case new
    case waxingCrescent
    case firstQuarter
    case waxingGibbous
    case full
    case waningGibbous
    case lastQuarter
    case waningCrescent
}

public extension DailyMoonPhase {
    static func from(_ weatherKit: WeatherKit.MoonPhase) -> DailyMoonPhase {
        switch weatherKit {
        case .new: .new
        case .waxingCrescent: .waxingCrescent
        case .firstQuarter: .firstQuarter
        case .waxingGibbous: .waxingGibbous
        case .full: .full
        case .waningGibbous: .waningGibbous
        case .lastQuarter: .lastQuarter
        case .waningCrescent: .waningCrescent
        }
    }
}
