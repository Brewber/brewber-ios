//
//  LoginViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/23/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    var successfulLoginDismissBlock: (()->())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupLoginButton()
    }
    
    func setupLoginButton() {
        self.loginButton.layer.cornerRadius = 5
        self.loginButton.clipsToBounds = true
        self.loginButton.addTarget(self, action: #selector(loginButtonPressed), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func setupNavigationBar() {
        self.navigationController!.navigationBar.barTintColor = UIColor.vividRedColor()
        self.navigationController?.navigationBar.topItem?.title = "Log in"
        let closeButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(closeButtonPressed))
        closeButton.tintColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = closeButton
        self.navigationController?.navigationBar.translucent = false
        
        let titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
    }
    
    func closeButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func loginButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: self.successfulLoginDismissBlock)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
