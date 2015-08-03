//
//  AddInteractorIO.swift
//  DownloadCount
//
//  Created by James Tang on 3/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

public protocol AddInteractorInput
{
    func addSource(source: Github.Repository.Identifier)
}

public protocol AddInteractorOutput
{
    func didAddSource()
}