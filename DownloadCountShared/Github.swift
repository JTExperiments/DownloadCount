//
//  GithubRelease.swift
//  DownloadCount
//
//  Created by James Tang on 1/8/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import Foundation

public struct Github {

    public struct Error {
        let error : NSError?
        init(error: NSError?) {
            self.error = error
        }
    }

    public struct Release {

        let name : String!
        let assets : [Asset]!

        public struct Asset {
            let name : String
            let downloadCount: Int

            public init(name: String, downloadCount:Int) {
                self.name = name
                self.downloadCount = downloadCount
            }

            public init(dict: NSDictionary) {
                self.name = dict["name"] as! String
                self.downloadCount = dict["download_count"] as! Int
            }

            static func createAssets(array: [NSDictionary]) -> [Asset] {
                return array.map { (item: NSDictionary) -> Asset in
                    return Asset(dict: item)
                }
            }
        }


        static func fromData(data:NSData?) -> [Github.Release]? {

            if let data = data {
                do {
                    if let jsonArray = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [NSDictionary] {
                        return jsonArray.map { json in
                            return Github.Release(dictionary: json)
                        }
                    } else {
                    }
                } catch _ {
                }
            }
            return nil
        }

        init(dictionary: NSDictionary) {
            self.name = dictionary["name"] as! String
            self.assets = Asset.createAssets(dictionary["assets"] as! [NSDictionary])
        }
    }
}
