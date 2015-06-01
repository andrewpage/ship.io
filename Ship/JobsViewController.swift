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
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "JobCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var job = jobs[indexPath.row]
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("JobCell") as! UITableViewCell
 
        cell.textLabel?.text = job.friendlyName

        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
}
