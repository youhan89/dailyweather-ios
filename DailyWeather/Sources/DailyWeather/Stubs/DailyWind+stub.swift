//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-29.
//

import Foundation

extension DailyWind {
    public static func stubLow() -> DailyWind {
        DailyWind(
            speed: Measurement(value: 1.0, unit: .metersPerSecond),
            gusts: Measurement(value: 3.0, unit: .metersPerSecond),
            compassDirection: .north
        )
    }
    
    public static func stubNormal() -> DailyWind {
        DailyWind(
            speed: Measurement(value: 8.0, unit: .metersPerSecond),
            gusts: Measurement(value: 12.0, unit: .metersPerSecond),
            compassDirection: .south
        )
    }
    
    public static func stubHigh() -> DailyWind {
        DailyWind(
            speed: Measurement(value: 20.0, unit: .metersPerSecond),
            gusts: Measurement(value: 30.0, unit: .metersPerSecond),
            compassDirection: .east
        )
    }
}
