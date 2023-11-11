//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-27.
//

import Foundation
import WeatherKit

public struct DailyMoon {
    public let moonrise: Date
    public let moonset: Date
    public let moonPhase: DailyMoonPhase
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
    var sfSymbol: String {
        switch self {
        case .new:
            "moonphase.new.moon"
        case .waxingCrescent:
            "moonphase.waxing.crescent"
        case .firstQuarter:
            "moonphase.first.quarter"
        case .waxingGibbous:
            "moonphase.waxing.gibbous"
        case .full:
            "moonphase.full.moon"
        case .waningGibbous:
            "moonphase.waning.gibbous"
        case .lastQuarter:
            "moonphase.last.quarter"
        case .waningCrescent:
            "moonphase.waning.crescent"
        }
    }
    
    var description: String {
        switch self {
        case .new:
            "New Moon"
        case .waxingCrescent:
            "Waxing Crescent"
        case .firstQuarter:
            "First Quarter"
        case .waxingGibbous:
            "Waxing Gibbous"
        case .full:
            "Full Moon"
        case .waningGibbous:
            "Waning Gibbous"
        case .lastQuarter:
            "Last Quarter"
        case .waningCrescent:
            "Waning Crescent"
        }
    }
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
