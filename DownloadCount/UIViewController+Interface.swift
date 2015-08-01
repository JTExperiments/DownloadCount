//
//  UIViewController+Interface.swift
//  DownloadCount
//
//  Created by James Tang on 2/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import UIKit
import DownloadCountShared

extension UIViewController : Interface  {
    public func showView(interface: Interface) {
        if let controller = interface as? UIViewController {
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
}

