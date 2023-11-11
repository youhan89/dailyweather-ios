//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-30.
//

import Foundation

extension DailyWeatherAttribution {
    static func stub() -> DailyWeatherAttribution {
        DailyWeatherAttribution(
            legalPageURL: URL(string: "https://developer.apple.com/weatherkit/data-source-attribution/")!,
            markUrl: URL(string: "https://developer.apple.com/licensing-trademarks/images/swift-logo.svg")!
        )
    }
}
