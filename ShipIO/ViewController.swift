//
//  ViewController.swift
//  ShipIO
//
//  Created by Andrew Page on 5/15/15.
//  Copyright (c) 2015 ShipIO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sEmailField: UITextField!
    @IBOutlet weak var sPasswordField: UITextField!
    @IBOutlet weak var sErrorLabel: UILabel!
    
    var apiManager: SAPIManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearError()
        
        apiManager = SAPIManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginAction(sender: UIButton) {
        var email = sEmailField.text
        var password = sPasswordField.text
        
        if(email.isEmpty) {
            error("You must enter an email.")
            return
        } else if(password.isEmpty) {
            error("You must enter a password.")
            return
        } else {
            clearError()
            
            apiManager.login(email, password: password, success: { () in
                    self.apiManager.loadJobs({ (jobs) -> Void in
                        for job in jobs {
                            println("Name: " + job.friendlyName)
                            
                            for build in job.builds {
                                    println("\tBuild: " + build.uuid)
                            }
                        }
                    }, failed: { (errorMessage) -> Void in
                        println(errorMessage)
                    })
                },  failed: { (errorMessage: String) in
                self.error(errorMessage)
            })
        }
    }
    
    func error(errorMessage: String) {
        sErrorLabel.text = errorMessage;
    }
    
    func clearError() {
        sErrorLabel.text = ""
    }
}

