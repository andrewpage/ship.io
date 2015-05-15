//
//  SAPIManager.swift
//  ShipIO
//
//  Created by Andrew Page on 5/15/15.
//  Copyright (c) 2015 ShipIO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SAPIManager: NSObject {
    static let baseUrl = "https://app.ship.io/"
    var accessToken: String!
    
    func login(email:String, password:String, success: () -> Void, failed: (errorMessage:String) -> Void) {
        Alamofire.request(.POST, getAPIURL("authenticate"), parameters: ["email": email, "password": password])
            .responseJSON { (_, _, json, error) in
                if(error != nil) {
                    failed(errorMessage: "Usename or password incorrect.")
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
                    var jobs = [SJob]()
                    
                    for (key, subJson) in json {
                        var job = SJob()
                        
                        job.uuid = subJson["uuid"].stringValue
                        job.friendlyName = subJson["name"].stringValue
                        
                        jobs.append(job)
                    }
                    
                    success(jobs: jobs)
                }
            }
        }
    }
    
    func isAuthenticated() -> Bool {
        return (accessToken != nil)
    }
    
    private func getAPIURL(endpoint:String) -> String {
        return SAPIManager.baseUrl + endpoint
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
