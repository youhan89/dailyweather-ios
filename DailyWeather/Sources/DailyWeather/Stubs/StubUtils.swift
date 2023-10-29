//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-29.
//

import Foundation

final class StubUtils {
    private static var calendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = utcTimeZone
        return calendar
    }
    
    private static var utcTimeZone: TimeZone {
        TimeZone(identifier: "UTC")!
    }
    
    static var sunriseDate: Date {
        // Define the components for your specific date
        var dateComponents = DateComponents()
        dateComponents.year = 2023
        dateComponents.month = 10
        dateComponents.day = 29
        dateComponents.hour = 8
        dateComponents.minute = 0
        dateComponents.second = 0
        dateComponents.timeZone = utcTimeZone

        // Create a Date object using the Calendar and components
        return calendar.date(from: dateComponents)!
    }
    
    static var sunsetDate: Date {
        // Define the components for your specific date
        var dateComponents = DateComponents()
        dateComponents.year = 2023
        dateComponents.month = 10
        dateComponents.day = 29
        dateComponents.hour = 20
        dateComponents.minute = 0
        dateComponents.second = 0
        dateComponents.timeZone = utcTimeZone

        // Create a Date object using the Calendar and components
        return calendar.date(from: dateComponents)!
    }
    
    static var moonriseDate: Date {
        // Define the components for your specific date
        var dateComponents = DateComponents()
        dateComponents.year = 2023
        dateComponents.month = 10
        dateComponents.day = 29
        dateComponents.hour = 18
        dateComponents.minute = 0
        dateComponents.second = 0
        dateComponents.timeZone = utcTimeZone

        // Create a Date object using the Calendar and components
        return calendar.date(from: dateComponents)!
    }
    
    static var moonsetDate: Date {
        // Define the components for your specific date
        var dateComponents = DateComponents()
        dateComponents.year = 2023
        dateComponents.month = 10
        dateComponents.day = 29
        dateComponents.hour = 7
        dateComponents.minute = 0
        dateComponents.second = 0
        dateComponents.timeZone = utcTimeZone

        // Create a Date object using the Calendar and components
        return calendar.date(from: dateComponents)!
    }
}
