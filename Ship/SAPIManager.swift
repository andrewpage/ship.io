//
//  SAPIManager.swift
//  Ship
//
//  Created by Andrew Page on 5/15/15.
//  Copyright (c) 2015 Ship. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SAPIManager: NSObject {
    static let baseURL = "http://dev.ship.io:3000"
    static let baseAPIPath = "api/rest/v1"
    
    var accessToken: String!
    
    func login(email:String, password:String, success: () -> Void, failed: (errorMessage:String) -> Void) {
        Alamofire.request(.POST, getAPIURL("authenticate", useAPIPath: false), parameters: ["email": email, "password": password])
            .responseJSON { (_, _, json, error) in
                if(error != nil) {
                    failed(errorMessage: "Username or password incorrect.")
                } else {
                    var json = JSON(json!)
                    self.accessToken = json["access_token"].stringValue
                    
                    success()
                }
        }
    }
    
    func loadJobs(success: (jobs:[SJob]) -> Void, failed: (errorMessage:String) -> Void) {
        if(isAuthenticated()) {
            Alamofire.request(.GET, getAPIURL("jobs.json"), parameters: authenticationParameters()).responseJSON {
                    (_, _, json, error) in
                
                if(error != nil) {
                    failed(errorMessage: "Could not load jobs.")
                } else {
                    var json = JSON(json!)
                    var jobsJSON = json["jobs"]
                    var buildsJSON = json["builds"]
                    
                    var jobs = [SJob]()
                    var builds = [SBuild]()
                    
                    for (key, subJson) in jobsJSON {
                        var job = SJob()
                        
                        job.uuid = subJson["uuid"].stringValue
                        job.friendlyName = subJson["name"].stringValue
                        
                        jobs.append(job)
                    }
                    
                    for (key, subJson) in buildsJSON {
                        var build = SBuild()
                        
                        build.uuid = subJson["uuid"].stringValue
                        build.buildNumber = subJson["buildNumber"].intValue
                        build.state = SBuild.buildStateFromString(subJson["status"].stringValue)
                        
                        for job in jobs {
                            if(job.uuid == subJson["job_uuid"].stringValue) {
                                job.builds.append(build)
                            }
                        }
                    }
                    
                    success(jobs: jobs)
                }
            }
        }
    }
    
    func isAuthenticated() -> Bool {
        return (accessToken != nil)
    }
    
    private func getAPIURL(endpoint:String, useAPIPath:Bool = true) -> String {
        var endpointToUse:String = endpoint;
        
        if(useAPIPath) {
            endpointToUse = "\(SAPIManager.baseAPIPath)/\(endpointToUse)"
        }

        return "\(SAPIManager.baseURL)/\(endpointToUse)"
    }
    
    private func authenticationParameters() -> Dictionary<String, String> {
        if(!isAuthenticated()) {
            return [:]
        } else {
            return [
                "token": accessToken
            ]
        }
    }
}
