//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-29.
//

import Foundation
import OSLog
extension Logger {
    init(_ category: String) {
        self.init(subsystem: "com.jsogaard.DailyWeather", category: category)
    }
}
