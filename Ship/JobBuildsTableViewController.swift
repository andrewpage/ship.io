//
//  JobBuildsTableViewController.swift
//  Ship
//
//  Created by Andrew Page on 6/2/15.
//  Copyright (c) 2015 Ship. All rights reserved.
//

import UIKit

class JobBuildsTableViewController: UITableViewController {
    var builds:[SBuild]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var parent:JobViewController = self.parentViewController as! JobViewController
        builds = parent.job.builds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return builds.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let build:SBuild = builds[indexPath.row]
        let cell:BuildTableViewCell = tableView.dequeueReusableCellWithIdentifier("BuildCell", forIndexPath: indexPath) as! BuildTableViewCell
        
        cell.buildLabel.text = "Build #\(build.buildNumber)"
        cell.stateLabel.text = build.state.description
        
        switch(build.state as SBuild.BuildState) {
        case SBuild.BuildState.Passed:
            cell.backgroundColor = UIColor.greenColor()
        case SBuild.BuildState.Failed:
            cell.backgroundColor = UIColor.redColor()
        case SBuild.BuildState.Queued:
            cell.backgroundColor = UIColor.blueColor()
        case SBuild.BuildState.Started:
            cell.backgroundColor = UIColor.blueColor()
        default:
            cell.backgroundColor = UIColor.grayColor()
        }

        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
}
