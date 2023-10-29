//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-29.
//

import Foundation

extension DailyPrecipitation {
    static func stubNoRain() -> DailyPrecipitation {
        DailyPrecipitation(
            rainfallAmount: Measurement(value: 0.0, unit: .millimeters),
            snowfallAmount: Measurement(value: 0.0, unit: .millimeters),
            chance: 0.0,
            type: .none
        )
    }
    
    static func stubLightRain() -> DailyPrecipitation {
        DailyPrecipitation(
            rainfallAmount: Measurement(value: 0.5, unit: .millimeters),
            snowfallAmount: Measurement(value: 0.0, unit: .millimeters),
            chance: 0.3,
            type: .rain
        )
    }
    
    static func stubHeavyRain() -> DailyPrecipitation {
        DailyPrecipitation(
            rainfallAmount: Measurement(value: 30.0, unit: .millimeters),
            snowfallAmount: Measurement(value: 0.0, unit: .millimeters),
            chance: 0.8,
            type: .rain
        )
    }
    
    static func stubLightSnow() -> DailyPrecipitation {
        DailyPrecipitation(
            rainfallAmount: Measurement(value: 0.0, unit: .millimeters),
            snowfallAmount: Measurement(value: 0.5, unit: .millimeters),
            chance: 0.3,
            type: .snow
        )
    }
    
    static func stubHeavySnow() -> DailyPrecipitation {
        DailyPrecipitation(
            rainfallAmount: Measurement(value: 0.0, unit: .millimeters),
            snowfallAmount: Measurement(value: 30.0, unit: .millimeters),
            chance: 0.8,
            type: .snow
        )
    }
    
    static func stubMixed() -> DailyPrecipitation {
        DailyPrecipitation(
            rainfallAmount: Measurement(value: 10.0, unit: .millimeters),
            snowfallAmount: Measurement(value: 10.0, unit: .millimeters),
            chance: 0.5,
            type: .mixed
        )
    }
}
