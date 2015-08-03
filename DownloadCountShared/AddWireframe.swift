 //
//  AddWireframe.swift
//  DownloadCount
//
//  Created by James Tang on 3/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import Foundation

public protocol AddWireframe {
    var presenter : AddPresenter? { get set }
    func showAddFromView(view: Interface)
}
