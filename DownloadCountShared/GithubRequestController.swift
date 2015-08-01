//
//  GithubRequestController.swift
//  DownloadCount
//
//  Created by James Tang on 1/8/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import Foundation

public class GithubRequestController : GithubDatasource {

    /* Configure session, choose between:
    * defaultSessionConfiguration
    * ephemeralSessionConfiguration
    * backgroundSessionConfigurationWithIdentifier:
    And set session-wide properties, such as: HTTPAdditionalHeaders,
    HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
    */

    let sessionConfig : NSURLSessionConfiguration
    let session : NSURLSession

    public init() {
        sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
    }

    public func getReleases(owner: String, repository: String, completion: (([Github.Release]?, Github.Error?) -> ())) {

        let URL = NSURL(string: "https://api.github.com/repos/\(owner)/\(repository)/releases")
        let request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! NSHTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")

                if let data = data, let release = Github.Release.fromData(data) {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        completion(release, nil)
                    })
                    return
                }
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(nil, Github.Error(error: error))
            })
        }
        task!.resume()
    }
    
}
