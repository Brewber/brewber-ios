//
//  TestViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/17/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITextFieldDelegate {
    
    var pageViewController: UIPageViewController!
    var firstViewController: ContentViewController!
    var modelViewController: ViewController!

    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    
    @IBOutlet var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray246Color()
        self.pageViewController = self.parentViewController as! UIPageViewController
        self.setupContinueButton()
        self.passwordTextField.addTarget(self, action: "textfieldDidChange:", forControlEvents: .EditingChanged)
        self.passwordTextField.delegate = self
        self.usernameTextField.addTarget(self, action: "textfieldDidChange:", forControlEvents: .EditingChanged)
        self.usernameTextField.delegate = self
    }

    func setupContinueButton() {
        self.continueButton.titleLabel!.text = "Continue"
        self.continueButton.layer.cornerRadius = 5
        self.continueButton.clipsToBounds = true
        self.continueButton.userInteractionEnabled = false
        self.continueButton.backgroundColor = UIColor.vividRedNoSelectionColor()
    }
    
    func continueButtonEnabled(enabled: Bool) {
        if (enabled) {
            self.continueButton.backgroundColor = UIColor.vividRedColor()
        }
        else {
            self.continueButton.backgroundColor = UIColor.vividRedNoSelectionColor()
        }
        self.continueButton.userInteractionEnabled = enabled
    }
    
    func textfieldDidChange(sender: UITextField) {
        if (self.passwordTextField.text?.characters.count != nil && self.usernameTextField.text?.characters.count != nil) {
            self.continueButtonEnabled(true)
        }
    }
    
    @IBAction func continueButtonPressed(sender: AnyObject) {
        self.modelViewController.moveToViewControllerAtIndex(2, pageDirection: .Forward)
    }
}
