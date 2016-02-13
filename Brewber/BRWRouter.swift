//
//  BRWRouter.swift
//  Brewber
//
//  Created by Alex Brashear on 2/12/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import Foundation

struct BRWRouter {
    
    private static let host = "192.241.179.242"
    
    static func URLStringForPath(path: String) -> String {
        let urlString: String = "http://" + host + path
        return urlString
    }
}
