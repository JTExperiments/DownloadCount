//
//  DashboardWireframe.swift
//  DownloadCount
//
//  Created by James Tang on 2/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import Foundation

public protocol DashboardWireframe {
    var presenter : DashboardPresenter? { get }
//    func view() -> Interface
    func showDashboardFromView(view: Interface)
    func showAddFromView(view: Interface)
}
