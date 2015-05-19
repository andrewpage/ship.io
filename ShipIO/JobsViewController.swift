//
//  JobsViewController.swift
//  ShipIO
//
//  Created by Andrew Page on 5/15/15.
//  Copyright (c) 2015 ShipIO. All rights reserved.
//

import UIKit

class JobsViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
}
