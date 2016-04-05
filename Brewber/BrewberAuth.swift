//
//  BrewberAuth.swift
//  Brewber
//
//  Created by Alex Brashear on 1/19/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

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
        
        
    }
    
    func loginUser(username: String, password: String, completion:((success: Bool, error: NSError?)->())) {
//        let parameters: [String: String] = [BrewberAuth.emailParameterKey: username,
//                                            BrewberAuth.passwordParameterKey: password]
//        let requestURLString = BRWRouter.URLStringForPath(BrewberAuth.loginURLPath)
    }
    
    
    func signupUser(user: BrewberUser, completion:((success: Bool, error: NSError?)->())) {
//        let parameters: [String: String] = [BrewberAuth.emailParameterKey: user.email,
//                                            BrewberAuth.passwordParameterKey: user.password]
//        let requestURLString = BRWRouter.URLStringForPath(BrewberAuth.signupURLPath)
//        
    }
}
