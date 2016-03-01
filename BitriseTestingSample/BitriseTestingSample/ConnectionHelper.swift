//
//  ConnectionHelper.swift
//  BitriseTestingSample
//
//  Created by Tamás Bazsonyi on 6/19/15.
//  Copyright (c) 2015 Bitrise. All rights reserved.
//

import UIKit

class ConnectionHelper: NSObject {
    static func pingServer() -> Bool {
        let urlPath: String = "http://google.com"
        let url: NSURL = NSURL(string: urlPath)!
        let request1: NSURLRequest = NSURLRequest(URL: url)
        var response: NSURLResponse?
        var error: NSError?
        let urlData: NSData?
        do {
            urlData = try NSURLConnection.sendSynchronousRequest(request1, returningResponse: &response)
        } catch let error1 as NSError {
            error = error1
            urlData = nil
        }
        if let httpResponse = response as? NSHTTPURLResponse {
            if(httpResponse.statusCode == 200)
            {
                return true
            } else {
                return false
            }
        }
        return false
    }

}
