//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-30.
//

import Foundation
import WeatherKit

public enum DailyUVExposureCategory {
    case low
    case moderate
    case high
    case veryHigh
    case extreme
}

extension DailyUVExposureCategory {
    static func from(_ weatherKit: UVIndex.ExposureCategory) -> DailyUVExposureCategory {
        switch weatherKit {
        case .low: .low
        case .moderate: .moderate
        case .high: .high
        case .veryHigh: .veryHigh
        case .extreme: .extreme
        }
    }
}
