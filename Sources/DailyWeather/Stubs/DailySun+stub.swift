//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-29.
//

import Foundation

public extension DailySun {
    static func stub() -> DailySun {
        return DailySun(
            sunrise: StubUtils.sunriseDate,
            sunset: StubUtils.sunsetDate
        )
    }
}
