//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-30.
//

import Foundation
import WeatherKit

public struct DailyUVIndex {
    public let value: Int
    public let exposureCatagory: DailyUVExposureCategory
    public let description: String
}

extension DailyUVIndex {
    static func from(_ weatherKit: UVIndex) -> DailyUVIndex {
        DailyUVIndex(
            value: weatherKit.value,
            exposureCatagory: .from(weatherKit.category),
            description: weatherKit.category.description
        )
    }
}
