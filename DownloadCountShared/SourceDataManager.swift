//
//  AddDataManager.swift
//  DownloadCount
//
//  Created by James Tang on 3/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

public class SourceDataManager
{
    public init() {

    }

    func addNewSource(source: Source, completion:((success: Bool)->())?) {
        do {
            let realm = try Realm()
            realm.write {
                realm.add(source, update:true)
            }
            completion?(success:true)
            return
        } catch let error {
            completion?(success:false)
            print("AddDataManager: addNewSource error \(error)")
        }

    }

    func getSources() -> [Source]? {
        do {
            let realm = try Realm()
            let results = realm.objects(Source)
            var array = [Source]()
            for var i = 0; i < results.count; i++ {
                array.append(results[i])
            }
            return array
        } catch _ {

        }

        return []
    }
}