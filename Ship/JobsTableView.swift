//
//  JobsTableView.swift
//  Ship
//
//  Created by Andrew Page on 6/1/15.
//  Copyright (c) 2015 Ship. All rights reserved.
//

import UIKit

class JobsTableView: UITableView {
    var jobs:[SJob]!
    
    override func numberOfRowsInSection(section: Int) -> Int {
        return jobs.count
    }
    
    override func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell? {
        var job = jobs[indexPath.row]
        var cell:JobTableViewCell = self.dequeueReusableCellWithIdentifier("JobCell") as! JobTableViewCell
        
        cell.nameLabel.text = job.friendlyName
        cell.statusLabel.text = job.builds.last?.state.description
        cell.buildLabel.text = "#\(job.builds.count)"
        
        return cell
    }
}
