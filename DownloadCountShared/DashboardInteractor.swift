//
//  DashboardInteractor.swift
//  DownloadCount
//
//  Created by James Tang on 1/8/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import Foundation

public class DashboardInteractor : DashboardInteractorInput {
    public var output : DashboardInteractorOutput?
    public var github : GithubDatasource
    public var source : SourceDataManager

    public init(github: GithubDatasource, source: SourceDataManager) {
        self.github = github
        self.source = source
    }

    public func fetchSections() {

        let sources : [Source] = source.getSources() ?? []
        let repos : [[String]] = sources.map { (source:Source) -> [String] in
            return [source.owner, source.name]
        }

        let _group = dispatch_group_create()
        var _error : DashboardInterfaceError? = nil
        var _sections = [DashboardSection]()

        for repo in repos {
            dispatch_group_enter(_group)
            let _key = repo.first!
            let _value = repo.last!
            self.github.getReleases(_key, repository: _value) { (releases, error) -> () in

                if let error = error {
                    _error = DashboardInterfaceError()
                    dispatch_group_leave(_group)
                } else {
                    if let release = releases?.last {
                        let section = DashboardSection(name: release.name, items: release.assets.map { asset -> DashboardItem in
                            return DashboardItem(asset: asset)
                            } ?? [])
                        _sections.append(section)
                        dispatch_group_leave(_group)
                    }
                }
            }
        }

        dispatch_group_notify(_group, dispatch_get_main_queue(), { () -> Void in
            if _sections.count > 0 {
                self.output?.foundSections(_sections)
            } else {
                self.output?.fetchSectionsFailedWithError(_error ?? DashboardInterfaceError())
            }
        })
    }

}
