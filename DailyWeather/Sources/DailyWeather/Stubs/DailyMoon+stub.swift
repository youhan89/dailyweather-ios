//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-29.
//

import Foundation

extension DailyMoon {
    static func stub() -> DailyMoon {
        DailyMoon(
            moonrise: StubUtils.moonriseDate,
            moonset: StubUtils.moonsetDate,
            moonPhase: .full
        )
    }
}
