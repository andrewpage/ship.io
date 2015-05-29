//
//  SBuild.swift
//  Ship
//
//  Created by Andrew Page on 5/15/15.
//  Copyright (c) 2015 Ship. All rights reserved.
//

import UIKit

class SBuild: NSObject {
    enum BuildState {
        case Queued
        case Started
        case Passed
        case Failed
        case Cancelled
        case TimedOut
    }
    
    var uuid: String!
    var buildNumber: Int!
    var state: BuildState!
    
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
