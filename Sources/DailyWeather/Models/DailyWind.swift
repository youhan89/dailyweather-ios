//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-27.
//

import Foundation
import WeatherKit

public struct DailyWind {
    public let speed: Measurement<UnitSpeed>
    public let gusts: Measurement<UnitSpeed>?
    public let compassDirection: WindCompassDirection
}

public extension DailyWind {
    var speedFormatted: String {
        speed.formatted(.measurement(width: .abbreviated, usage: .wind))
    }
    
    var gustsFormatted: String? {
        gusts?.formatted(.measurement(width: .abbreviated, usage: .wind))
    }
}

extension DailyWind {
    public static func from(_ weatherKit: Wind) -> DailyWind {
        DailyWind(
            speed: weatherKit.speed,
            gusts: weatherKit.gust,
            compassDirection: .from(weatherKit.compassDirection)
        )
    }
}

public enum WindCompassDirection {
    case north
    case northNortheast
    case northeast
    case eastNortheast
    case east
    case eastSoutheast
    case southeast
    case southSoutheast
    case south
    case southSouthwest
    case southwest
    case westSouthwest
    case west
    case westNorthwest
    case northwest
    case northNorthwest
}

extension WindCompassDirection {
    static func from(_ weatherKit: Wind.CompassDirection) -> WindCompassDirection {
        switch weatherKit {
        case .north: .north
        case .northNortheast: .northNortheast
        case .northeast: .northeast
        case .eastNortheast: .eastNortheast
        case .east: .east
        case .eastSoutheast: .eastSoutheast
        case .southeast: .southeast
        case .southSoutheast: .southSoutheast
        case .south: .south
        case .southSouthwest: .southSouthwest
        case .southwest: .southwest
        case .westSouthwest: .westSouthwest
        case .west: .west
        case .westNorthwest: .westNorthwest
        case .northwest: .northwest
        case .northNorthwest: .northNorthwest
        }
    }
}

public extension WindCompassDirection {
    var sfSymbol: String {
        switch self {
        case .north: "arrow.up"
        case .northNortheast: "arrow.up"
        case .northeast: "arrow.up.right"
        case .eastNortheast: "arrow.right"
        case .east: "arrow.right"
        case .eastSoutheast: "arrow.down.right"
        case .southeast: "arrow.down.right"
        case .southSoutheast: "arrow.down"
        case .south: "arrow.down"
        case .southSouthwest: "arrow.down"
        case .southwest: "arrow.down.left"
        case .westSouthwest: "arrow.left"
        case .west: "arrow.left"
        case .westNorthwest: "arrow.left"
        case .northwest: "arrow.up.left"
        case .northNorthwest: "arrow.up"
        }
    }
}
