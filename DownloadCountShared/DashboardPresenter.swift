//
//  DashboardPresenter.swift
//  DownloadCount
//
//  Created by James Tang on 1/8/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import Foundation


public protocol DashboardPresenter : DashboardInteractorOutput {
    var interactor : DashboardInteractor { get }
    var view : DashboardInterface { get }
}

public extension DashboardPresenter {

    public func fetchSections() {
        self.interactor.fetchSections()
        self.view.showLoading()
    }

    public func foundSections(sections : [DashboardSection]) {
        self.view.reloadDataWithSections(sections)
        self.view.stopLoading()
    }

    public func fetchSectionsFailedWithError(error: DashboardInterfaceError) {
        self.view.showError(error)
        self.view.stopLoading()
    }

}