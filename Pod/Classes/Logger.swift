//
//  Logger.swift
//  Pods
//
//  Created by MichaelSelsky on 11/30/15.
//
//

import UIKit

public struct Log<T> { //TODO: Rename
    let level: HermesLevel
    let info: T
    let fileName: String
    let functionName: String
    let lineNumber: Int
}

public protocol Logger {
    func handleLog<T>(log: Log<T>)
}

public enum HermesLevel: Int {
    case Debug = 1
    case Info = 2
    case Warning = 3
    case Error = 4
    case Fatal = 5
    
    func levelText() -> String {
        switch self {
        case .Debug:
            return "Debug: "
        case .Info:
            return "Info: "
        case .Warning:
            return "Warning: "
        case .Error:
            return "Error: "
        case .Fatal:
            return "Fatal: "
        }
    }
    
    func levelColor() -> UIColor {
        switch self {
        case .Debug:
            return UIColor(red: 120.0/255.0, green: 120.0/255.0, blue: 120.0/255.0, alpha: 1)
        case .Info:
            return UIColor(red: 0.0/255.0, green: 180.0/255.0, blue: 180.0/255.0, alpha: 1)
        case .Warning:
            return UIColor(red: 0.0/255.0, green: 150.0/255.0, blue: 0.0/255.0, alpha: 1)
        case .Error:
            return UIColor(red: 255.0/255.0, green: 19.0/255.0, blue: 0.0/255.0, alpha: 1)
        case .Fatal:
            return UIColor(red: 160.0/255.0, green: 32.0/255.0, blue: 240.0/255.0, alpha: 1)
        }
    }
}