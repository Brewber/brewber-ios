//
//  NetworkResponse.swift
//  Brewber
//
//  Created by Alex Brashear on 1/21/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class NetworkResponse: NSObject {
    
    var URLResponse: NSURLResponse!
    var URL: NSURL!
    var responseObject: AnyObject
    var error: NSError?
    var originalRequest: NSURLRequest!
    
    init(URLResponse: NSURLResponse, URL: NSURL, responseObject: AnyObject, error: NSError, originalRequest: NSURLRequest) {
        self.URLResponse = URLResponse
        self.URL = URL
        self.responseObject = responseObject
        self.error = error
        self.originalRequest = originalRequest
    }

}
