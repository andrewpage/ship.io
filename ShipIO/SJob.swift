//
//  SJob.swift
//  ShipIO
//
//  Created by Andrew Page on 5/15/15.
//  Copyright (c) 2015 ShipIO. All rights reserved.
//

import UIKit

class SJob: NSObject {
    var uuid: String!
    var friendlyName: String!
    var builds: [SBuild]!
    
    override init() {
        builds = [SBuild]()
    }
}
