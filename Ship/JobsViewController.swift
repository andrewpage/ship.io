//
//  JobsViewController.swift
//  Ship
//
//  Created by Andrew Page on 6/1/15.
//  Copyright (c) 2015 Ship. All rights reserved.
//

import UIKit

class JobsViewController: UIViewController {
    var jobs:[SJob]!
    var tableViewController:JobsTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "TableViewControllerEmbed") {
            tableViewController = segue.destinationViewController as! JobsTableViewController
            
            tableViewController.jobs = jobs
        }
    }
}
