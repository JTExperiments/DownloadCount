//
//  UIView+Interface.swift
//  DownloadCount
//
//  Created by James Tang on 3/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import UIKit
import DownloadCountShared

extension UIWindow : Interface {

    public func showView(interface: Interface) {
        if let controller = interface as? UIViewController {
            self.rootViewController = controller
        }
    }

    public func dismiss() {
        // do nothing
    }
    
}