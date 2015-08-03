 //
//  AddWireframe.swift
//  DownloadCount
//
//  Created by James Tang on 3/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//


import UIKit
import DownloadCountShared

 class AddRouter : AddWireframe
{
    var presenter : AddPresenter?

    private func mainStoryboard() -> UIStoryboard
    {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle:NSBundle.mainBundle())
        return storyboard
    }

    func addViewContorller() -> AddViewController {
        let storyboard = self.mainStoryboard()
        let controller = storyboard.instantiateViewControllerWithIdentifier("AddViewController") as! AddViewController
        controller.presenter = self.presenter
        self.presenter?.view = controller
        return controller
    }

    func showAddFromView(view: Interface) {
        let navController = UINavigationController(rootViewController: self.addViewContorller())
        view.showView(navController)
    }

}
