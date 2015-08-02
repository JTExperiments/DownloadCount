//
//  AppDelegate.swift
//  DownloadCount
//
//  Created by James Tang on 1/8/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit
import DownloadCountShared

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.



        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.setupDependancy(window)
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

    func setupDependancy(window : UIWindow) {

        class DPresenter : DashboardPresenter {
            var interactor : DashboardInteractorInput
            var view : DashboardInterface
            init(interactor: DashboardInteractor, view: DashboardInterface) {
                self.interactor = interactor
                self.view = view
            }
        }

        let githubDatasource = GithubRequestController()
        let dashboardInteractor = DashboardInteractor(github: githubDatasource)
        let dashboardWireframe = DashboardRouter()
        let dashboardViewController = dashboardWireframe.interface
        let dashboardPresenter = DPresenter(interactor: dashboardInteractor, view: dashboardViewController)

        let navigationController = UINavigationController(rootViewController: dashboardViewController)
        dashboardInteractor.output = dashboardPresenter
        dashboardViewController.presenter = dashboardPresenter
    
        window.rootViewController = navigationController
    }

}

