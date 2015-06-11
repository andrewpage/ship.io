//
//  BuildTableViewCell.swift
//  Ship
//
//  Created by Andrew Page on 6/2/15.
//  Copyright (c) 2015 Ship. All rights reserved.
//

import UIKit

class BuildTableViewCell: UITableViewCell {
    @IBOutlet weak var buildLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
