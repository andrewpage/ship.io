//
//  JobsViewController.swift
//  Ship
//
//  Created by Andrew Page on 5/15/15.
//  Copyright (c) 2015 Ship. All rights reserved.
//

import UIKit

class JobsTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    var jobs:[SJob]!
    
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("JobSelectedSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var jobViewController:JobViewController = segue.destinationViewController as! JobViewController
        var selectedJobIndex = self.tableView.indexPathForSelectedRow()?.row
        
        jobViewController.job = jobs[selectedJobIndex!]
    }
}
