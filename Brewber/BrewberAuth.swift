//
//  BrewberAuth.swift
//  Brewber
//
//  Created by Alex Brashear on 1/19/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit
import Alamofire

struct BrewberAuthSignup {
    static let BrewberAuthSignupURL = "http://brewber.herokuapp.com/users"
    struct parameter {
        static let name = "name"
        static let username = "username"
        static let password = "password"
        static let phoneNumber = "phone_number"
    }
}

class BrewberAuth {
    
    private static let authController = BrewberAuth()
    
    // STUB: - Implement when token is available - fetches user from the keychain
    static func currentUser() -> BrewberUser? {
        return nil
    }
    
    // STUB:
    func isUserLoggedIn(user: BrewberUser) -> Bool {
        return false
    }
    
    // STUB:
    func logourUser(user: BrewberUser) {
        
    }
    
    // STUB:
    func loginUser(username: String, password: String) {
        
    }
    
    func signupUser(user: BrewberUser, completion:((success: Bool, error: NSError?)->())) {
        let parameters: [String: String] = [BrewberAuthSignup.parameter.name: "testname",
                                            BrewberAuthSignup.parameter.username: user.email,
                                            BrewberAuthSignup.parameter.password: user.password,
                                            BrewberAuthSignup.parameter.phoneNumber: user.phoneNumber]
        Alamofire.request(.POST, BrewberAuthSignup.BrewberAuthSignupURL, parameters: parameters, encoding: .JSON, headers: nil)
            .responseJSON { (response) -> Void in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                response.result.error
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    completion(success: true, error: nil)
                }
        }
    }
}
