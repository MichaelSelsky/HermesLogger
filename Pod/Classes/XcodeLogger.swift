//
//  XcodeLogger.swift
//  Pods
//
//  Created by MichaelSelsky on 11/30/15.
//
//

import Foundation

internal struct XcodeLogger: Logger {
    private let escape = "\u{001b}["
    private var reset_fg: String {
        get {
            return self.escape + "fg;"
        }
    }
    private var reset_bg: String {
        get {
            return escape + "bg;"
        }
    }
    private var reset: String {
        get {
            return escape + ";"
        }
    }
    
    func colorizedLogString<T>(log: HermesLogger.Log<T>) -> String{
        let logText = "\(log.fileName).\(log.functionName)[\(log.lineNumber)]\n\(log.info)"
        let color = log.level.levelColor()
        let colorTag = "\(color.redC),\(color.greenC),\(color.blueC);"
        let colorizedText = "\(escape)fg\(colorTag);\(logText)\(reset)"
        return colorizedText
    }
    
    internal func handleLog<T>(log: HermesLogger.Log<T>) {
        let logText = self.colorizedLogString(log)
        print(logText)
    }
}

private extension UIColor {
    var redC: Int {
        var r: CGFloat = 0
        getRed(&r, green: nil, blue: nil, alpha: nil)
        return Int(r * 255)
    }
    var greenC: Int {
        var g: CGFloat = 0
        getRed(nil, green: &g, blue: nil, alpha: nil)
        return Int(g * 255)
    }
    var blueC: Int {
        var b: CGFloat = 0
        getRed(nil, green: nil, blue: &b, alpha: nil)
        return Int(b * 255)
    }
}
