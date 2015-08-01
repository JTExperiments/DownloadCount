//
//  DashboardItem.swift
//  DownloadCount
//
//  Created by James Tang on 2/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import Foundation

public struct DashboardItem {
    public let name : String
    public let count : Int

    init(asset: Github.Release.Asset) {
        self.name = asset.name
        self.count = asset.downloadCount
    }
}