//
//  AddInteractor.swift
//  DownloadCount
//
//  Created by James Tang on 3/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import Foundation

public class AddInteractor: AddInteractorInput {

    public var output: AddInteractorOutput? = nil
    let dataManager: SourceDataManager

    public init(dataManager : SourceDataManager) {
        self.dataManager = dataManager
    }

    public func addSource(source: Github.Repository.Identifier) {
        self.dataManager.addNewSource(source.toSource()) { success in
            self.output?.didAddSource()
        }
    }

}
