//
//  NetworkRequestItem.swift
//  Brewber
//
//  Created by Alex Brashear on 1/21/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class NetworkRequestItem: NSObject {
    
    var URLRequest: NSURLRequest

    init(URLRequest: NSURLRequest) {
        self.URLRequest = URLRequest
    }
}
