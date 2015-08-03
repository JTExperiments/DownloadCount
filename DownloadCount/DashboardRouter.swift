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

    var presenter : DashboardPresenter?
    var addWireframe : AddWireframe?

    private func mainStoryboard() -> UIStoryboard
    {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle:NSBundle.mainBundle())
        return storyboard
    }

    private func dashboardViewContorller() -> DashboardViewController {
        let storyboard = self.mainStoryboard()
        let controller = storyboard.instantiateViewControllerWithIdentifier("DashboardViewController") as! DashboardViewController
        controller.presenter = self.presenter
        self.presenter?.view = controller
        controller.title = "Download Count"
        return controller
    }

    func view() -> Interface {
        return self.dashboardViewContorller()
    }

    func showDashboardFromView(view: Interface) {
        view.showView(self.dashboardViewContorller())
    }

    func showDashboardWithNavigationFromView(view: Interface) {
        let nav = UINavigationController(rootViewController: self.dashboardViewContorller())
        view.showView(nav)
    }

    func showAddFromView(view: Interface) {
        addWireframe?.showAddFromView(view)
    }
}