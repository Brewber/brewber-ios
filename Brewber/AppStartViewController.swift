//
//  AppStartViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/15/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class AppStartViewController: UIViewController {
    
    let paddingFromBottom : CGFloat = -120.0
    let presentSignupModalSegue = "presentSignupModalSegue"
    let presentFeedViewControllerSegue = "presentFeedViewControllerSegue"
    let presentLoginModalSegue = "presentLoginModalSegue"

    @IBOutlet var signupButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = applicationTintColor()
        setupButton(self.loginButton)
        setupButton(self.signupButton)
        self.navigationController?.navigationBarHidden = true
    }
    
    func setupButton(button: UIButton) {
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.whiteColor().CGColor
        button.layer.borderWidth = 1.0;
        button.clipsToBounds = true
    }
    
    func dismissBlock() -> (() -> ()) {
        let dismissBlock = {
            self.performSegueWithIdentifier(self.presentFeedViewControllerSegue, sender: self)
        }
        return dismissBlock
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == presentSignupModalSegue {
            let destinationViewController = segue.destinationViewController as! UINavigationController
            let signupModel = destinationViewController.topViewController as! SignupModel
            signupModel.successfulSignupdismissBlock = dismissBlock()
        }
        else if segue.identifier == presentFeedViewControllerSegue {
            self.navigationController?.navigationBarHidden = false
        }
        else if segue.identifier == presentLoginModalSegue {
            let destinationViewController = segue.destinationViewController as! UINavigationController
            let loginViewController = destinationViewController.topViewController as! LoginViewController
            loginViewController.successfulLoginDismissBlock = dismissBlock()
        }
    }
    

}
