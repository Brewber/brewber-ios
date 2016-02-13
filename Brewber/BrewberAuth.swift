//
//  BrewberAuth.swift
//  Brewber
//
//  Created by Alex Brashear on 1/19/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit
import Alamofire

class BrewberAuth {
    
    private static let loginURLPath = "/users/sign_in"
    private static let signupURLPath = "/users.json"
    private static let logoutURLPath = "/users/sign_out"
    
    private static let emailParameterKey = "email"
    private static let passwordParameterKey = "password"
    
    func logoutCurrentUser(completion:((success: Bool, error: NSError?)->())) {
//  If we implement currentUser or something similar, we should check it before signing out
//        defer {
//            completion(success: false, error: nil)
//        }
//        guard let _ = BrewberAuth.currentUser() else {
//            return
//        }
        
        Alamofire.request(.DELETE, BRWRouter.URLStringForPath(BrewberAuth.loginURLPath))
        .responseJSON { (response) -> Void in
            // TODO: make this better
            completion(success: true, error: nil)
        }
    }
    
    func loginUser(username: String, password: String, completion:((success: Bool, error: NSError?)->())) {
        let parameters: [String: String] = [BrewberAuth.emailParameterKey: username,
                                            BrewberAuth.passwordParameterKey: password]
        let requestURLString = BRWRouter.URLStringForPath(BrewberAuth.loginURLPath)
        Alamofire.request(.POST, requestURLString, parameters: parameters, encoding: .JSON, headers: nil)
        .responseJSON { (response) -> Void in
            // TODO: Make this better
            completion(success: true, error: nil)
        }
    }
    
    
    func signupUser(user: BrewberUser, completion:((success: Bool, error: NSError?)->())) {
        let parameters: [String: String] = [BrewberAuth.emailParameterKey: user.email,
                                            BrewberAuth.passwordParameterKey: user.password]
        let requestURLString = BRWRouter.URLStringForPath(BrewberAuth.signupURLPath)
        Alamofire.request(.POST, requestURLString, parameters: parameters, encoding: .JSON, headers: nil)
        .responseJSON { (response) -> Void in
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                completion(success: true, error: nil)
            }
        }
    }
}
