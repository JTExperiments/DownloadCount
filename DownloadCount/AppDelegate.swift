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

        class DPresenter : DashboardPresenter, AddModuleDelegate {
            var interactor : DashboardInteractorInput
            var view : DashboardInterface?
            var wireframe : DashboardWireframe
            init(interactor: DashboardInteractor, wireframe: DashboardWireframe) {
                self.interactor = interactor
                self.wireframe = wireframe
            }

            func addSucceed() {
                self.fetchSections()
            }

            func addCancelled() {
                // do nothing
                print("cancelled")
            }
        }

        class APresenter : AddPresenter {
            var interactor : AddInteractorInput? = nil
            var view : AddViewInterface? = nil
            var wireframe : AddWireframe? = nil
            var delegate : AddModuleDelegate? = nil
            init(interactor: AddInteractor, wireframe: AddWireframe) {
                self.interactor = interactor
                self.wireframe = wireframe
            }
        }
        let sourceDataSource = SourceDataManager()
        let githubDatasource = GithubRequestController()
        let dashboardInteractor = DashboardInteractor(github: githubDatasource, source: sourceDataSource)
        let dashboardRouter = DashboardRouter()
        let dashboardPresenter = DPresenter(interactor: dashboardInteractor, wireframe: dashboardRouter)
        let addRouter = AddRouter()
        let addDataManager = sourceDataSource
        let addInteractor = AddInteractor(dataManager: addDataManager)
        let addPresenter = APresenter(interactor: addInteractor, wireframe: addRouter)
        addPresenter.delegate = dashboardPresenter
        addInteractor.output = addPresenter
        dashboardRouter.presenter = dashboardPresenter
        dashboardRouter.addWireframe = addRouter
        dashboardInteractor.output = dashboardPresenter
        dashboardRouter.showDashboardWithNavigationFromView(window)
        addRouter.presenter = addPresenter
    }

}

