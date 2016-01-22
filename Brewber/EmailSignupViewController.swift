//
//  TestViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/17/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class EmailSignupViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var errorLabel: UILabel!
    var pageViewController: UIPageViewController!
    var signupModel: SignupModel!

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
        self.errorLabel.hidden = true
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
        var enableContinueButton: Bool = false
        if (self.passwordTextField.text?.characters.count > 0 &&
            self.usernameTextField.text?.characters.count > 0) {
            enableContinueButton = true
        }
        self.continueButtonEnabled(enableContinueButton)
    }
    
    @IBAction func continueButtonPressed(sender: AnyObject) {
        let username = self.usernameTextField.text
        let password = self.passwordTextField.text
        if (username?.isValidEmail() == true) {
            if (password?.isValidPassword() == true) {
                self.proceedAndRegisterUserEmail(username!, password: password!)
            }
            else {
                self.errorLabel.text = "Password must be more than 7 characters"
                self.errorLabel.hidden = false
            }
        }
        else {
            self.errorLabel.text = "Please enter a valid email address"
            self.errorLabel.hidden = false
        }
    }
    
    func proceedAndRegisterUserEmail(email: String, password: String) {
        self.signupModel.newUser.email = email
        self.signupModel.newUser.password = password
        self.signupModel.moveToViewControllerAtIndex(Signup.Paging.PhoneVerificationViewControllerIndex, pageDirection: .Forward)
    }
}
