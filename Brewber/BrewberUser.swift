//
//  BrewberUser.swift
//  Brewber
//
//  Created by Alex Brashear on 1/19/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class BrewberUser: NSObject {
    
    /// 10 character string with only numbers
    var phoneNumber: String!
    
    /// User's validated email as a string
    var email: String!
    var password: String!
    
    /// 5 character string of numbers
    var zipcode: String!
    
    /// Number 1-12
    var birthdayMonth: Int!
    
    /// Number 1-31
    var birthdayDay: Int!
    
    // STUB:
    func isEqualToUser(user: BrewberUser) -> Bool {
        return false
    }
}
