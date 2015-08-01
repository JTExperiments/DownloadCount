//
//  GithubDatasource.swift
//  DownloadCount
//
//  Created by James Tang on 2/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import Foundation

public protocol GithubDatasource {
    func getReleases(owner: String, repository: String, completion:(([Github.Release]?, Github.Error?) -> ()))
}