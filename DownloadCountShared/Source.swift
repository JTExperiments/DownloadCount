//
//  Source.swift
//  DownloadCount
//
//  Created by James Tang on 3/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import Foundation
import RealmSwift

public class Source : Object {
    dynamic var name : String = "" {
        didSet {
            self.reloadIdentifier()
        }
    }
    dynamic var owner : String = "" {
        didSet {
            self.reloadIdentifier()
        }
    }
    dynamic var identifier : String = ""

    func reloadIdentifier() {
        self.identifier = "\(owner)/\(name)"
    }

    override public static func primaryKey() -> String? {
        return "identifier"
    }
}