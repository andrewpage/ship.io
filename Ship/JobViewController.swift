//
//  JobViewController.swift
//  Ship
//
//  Created by Andrew Page on 6/2/15.
//  Copyright (c) 2015 Ship. All rights reserved.
//

import UIKit

class JobViewController: UITabBarController {
    var job:SJob!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
