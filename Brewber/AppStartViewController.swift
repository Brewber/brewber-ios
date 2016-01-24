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

    @IBOutlet var signupButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = applicationTintColor()
        setupButton(self.loginButton)
        setupButton(self.signupButton)
        
    }
    
    func setupButton(button: UIButton) {
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.whiteColor().CGColor
        button.layer.borderWidth = 1.0;
        button.clipsToBounds = true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
