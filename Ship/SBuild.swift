//
//  SBuild.swift
//  Ship
//
//  Created by Andrew Page on 5/15/15.
//  Copyright (c) 2015 Ship. All rights reserved.
//

import UIKit

class SBuild: NSObject {
    enum BuildState: String, Printable {
        case Queued = "Queued"
        case Started = "Started"
        case Passed = "Passed"
        case Failed = "Failed"
        case Cancelled = "Cancelled"
        case TimedOut = "Timed out"
        
        var description : String {
            get {
                return self.rawValue
            }
        }
    }
    
    var uuid: String!
    var buildNumber: Int!
    var state: BuildState!
    
    init(uuid:String, buildNumber:Int, state:String) {
        self.uuid = uuid
        self.buildNumber = buildNumber
        self.state = SBuild.buildStateFromString(state)
    }
    
    static func buildStateFromString(state:String) -> BuildState {
        var cleanState = state.lowercaseString
        cleanState = cleanState.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        switch(cleanState) {
            case "queued":
            return BuildState.Queued
            case "started":
            return BuildState.Started
            case "passed":
            return BuildState.Passed
            case "failed":
            return BuildState.Failed
            case "cancelled":
            return BuildState.Cancelled
            case "timedout":
            return BuildState.Cancelled
            default:
            return BuildState.Queued
        }
    }
}
