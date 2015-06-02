//
//  JobOverviewViewController.swift
//  Ship
//
//  Created by Andrew Page on 6/2/15.
//  Copyright (c) 2015 Ship. All rights reserved.
//

import UIKit

class JobOverviewViewController: UIViewController {
    var job:SJob!
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var parent:JobViewController = self.parentViewController as! JobViewController
        job = parent.job
        
        nameLabel.text = job.friendlyName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
