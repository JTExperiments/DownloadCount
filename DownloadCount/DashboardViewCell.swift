//
//  DashboardViewCell.swift
//  DownloadCount
//
//  Created by James Tang on 2/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import UIKit
import DownloadCountShared

class DashboardViewCell : UITableViewCell {

    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var countLabel : UILabel!
    var dashboardItem : DashboardItem? {
        didSet {
            self.reloadData()
        }
    }

    func reloadData() {
        if let item = dashboardItem {
            self.nameLabel.text = item.name
            self.countLabel.text = "\(item.count)"
        }
    }
}
