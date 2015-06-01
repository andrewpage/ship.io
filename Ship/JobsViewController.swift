//
//  JobsViewController.swift
//  Ship
//
//  Created by Andrew Page on 5/15/15.
//  Copyright (c) 2015 Ship. All rights reserved.
//

import UIKit

class JobsViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    var jobs: [SJob]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var job = jobs[indexPath.row]
        var cell:JobTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("JobCell") as! JobTableViewCell
 
        
        cell.nameLabel.text = job.friendlyName
        cell.statusLabel.text = job.builds.last?.state.description
        cell.buildLabel.text = "#\(job.builds.count)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
}
