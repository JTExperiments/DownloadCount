//
//  DashboardInterface.swift
//  DownloadCount
//
//  Created by James Tang on 1/8/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import Foundation

public struct DashboardInterfaceError {

}

public protocol DashboardInterface : Interface {
    func reloadDataWithSections(sections: [DashboardSection])
    func showError(error: DashboardInterfaceError)
    func startLoading()
    func stopLoading()
}