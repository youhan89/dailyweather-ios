//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-30.
//

import Foundation
import WeatherKit

public struct DailyWeatherAttribution {
    public let legalPageURL: URL
    public let markUrl: URL
}

public extension DailyWeatherAttribution {
    static func from(_ weatherKit: WeatherAttribution) -> DailyWeatherAttribution {
        DailyWeatherAttribution(
            legalPageURL: weatherKit.legalPageURL,
            markUrl: weatherKit.combinedMarkDarkURL
        )
    }
}
