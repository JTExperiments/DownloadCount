//
//  DashboardInteractorIO.swift
//  DownloadCount
//
//  Created by James Tang on 3/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import Foundation

public protocol DashboardInteractorOutput {
    func fetchSectionsFailedWithError(error: DashboardInterfaceError)
    func foundSections(sections: [DashboardSection])
}

public protocol DashboardInteractorInput {
    func fetchSections()
}
