//
//HermesLogger.swift
//HermesLogger
//
//Created by Michael Selsky on 30/11/15
//Copyright (c) 2015 Michael Selsky. All rights reserved
//

import Foundation

public struct HermesLogs {
    public static var enabled = false
    
    public static var minimumLogLevelShown = 1
    
    public static func addLogger(logger: Logger) {
        HermesLogs.loggers.append(logger)
    }
    
    public static func test(){
        HL1Debug("debug")
        HL2Info("info")
        HL3Warning("warning")
        HL4Error("error")
        HL5Fatal("fatal")
    }
    
    private static var loggers: [Logger] = [XcodeLogger()]
    
    private static func shouldPrintLog<T>(log: Log<T>) -> Bool {
        return HermesLogs.enabled && self.shouldPrintLevel(log.level)
    }
    
    private static func shouldPrintLevel(level: HermesLevel) -> Bool {
        return HermesLogs.minimumLogLevelShown <= level.rawValue
    }
    
    private static func handleLog<T>(log: Log<T>) {
        if self.shouldPrintLog(log){
            self.loggers.forEach { (logger) -> () in
                logger.handleLog(log)
            }
        }
    }
    
}

public func HL1Debug<T>(info: T, _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__) {
    let log = Log(level: .Debug, info: info, fileName: file, functionName: function, lineNumber: line)
    HermesLogs.handleLog(log)
}

public func HL2Info<T>(info: T, _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__) {
    let log = Log(level: .Info, info: info, fileName: file, functionName: function, lineNumber: line)
    HermesLogs.handleLog(log)
}

public func HL3Warning<T>(info: T, _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__) {
    let log = Log(level: .Warning, info: info, fileName: file, functionName: function, lineNumber: line)
    HermesLogs.handleLog(log)
}

public func HL4Error<T>(info: T, _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__) {
    let log = Log(level: .Error, info: info, fileName: file, functionName: function, lineNumber: line)
    HermesLogs.handleLog(log)
}

public func HL5Fatal<T>(info: T, _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__) {
    let log = Log(level: .Fatal, info: info, fileName: file, functionName: function, lineNumber: line)
    HermesLogs.handleLog(log)
}
