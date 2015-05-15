//
//  SBuild.swift
//  ShipIO
//
//  Created by Andrew Page on 5/15/15.
//  Copyright (c) 2015 ShipIO. All rights reserved.
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
}
