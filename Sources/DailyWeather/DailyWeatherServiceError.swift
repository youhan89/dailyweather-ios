//
//  File.swift
//  
//
//  Created by Johan Sögaard on 2023-10-29.
//

import Foundation

public enum DailyWeatherServiceError: Error {
    case permissionDenied
    case unknownLocation
    case requestFailed
}
