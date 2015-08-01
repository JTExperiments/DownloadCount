//
//  DashboardRouter.swift
//  DownloadCount
//
//  Created by James Tang on 2/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import Foundation
import DownloadCountShared

class DashboardRouter : DashboardWireframe {
    var interface : DashboardViewController {
        get {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewControllerWithIdentifier("DashboardViewController") as! DashboardViewController
            controller.title = "Download Count"
            return controller
        }
    }

    func showDashboardFromView(view: Interface) {
        view.showView(self.interface)
    }
}