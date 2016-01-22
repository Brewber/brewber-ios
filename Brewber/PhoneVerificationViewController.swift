//
//  PhoneVerificationViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/18/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class PhoneVerificationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var codeTextField: UITextField!
    @IBOutlet var fourNumberField: UITextField!
    @IBOutlet var threeNumberField: UITextField!
    @IBOutlet var areaCodeField: UITextField!
    @IBOutlet var sendCodeButton: UIButton!
    @IBOutlet var verifyButton: UIButton!
    
    var signupModel: SignupModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.areaCodeField.addTarget(self, action: "textFieldDidChange:", forControlEvents: .EditingChanged)
        self.areaCodeField.delegate = self
        self.threeNumberField.addTarget(self, action: "textFieldDidChange:", forControlEvents: .EditingChanged)
        self.threeNumberField.delegate = self
        self.fourNumberField.addTarget(self, action: "textFieldDidChange:", forControlEvents: .EditingChanged)
        self.fourNumberField.delegate = self
        
        self.view.backgroundColor = UIColor.gray246Color()
        self.sendCodeButton.layer.cornerRadius = 5
        self.sendCodeButton.clipsToBounds = true
        
        self.verifyButton.layer.cornerRadius = 5
        self.verifyButton.clipsToBounds = true
        self.verifyButton.hidden = true
        self.codeTextField.hidden = true
    }
    
    // MARK: - IBAction's
        
    @IBAction func sendCodeButtonPressed(sender: AnyObject) {
        // TODO: Check if its a valid phone number
        
        self.verifyButton.hidden = false
        self.codeTextField.hidden = false
        
        // TODO: Send verification code
    }
    
    @IBAction func VerifyButtonPressed(sender: AnyObject) {
        // TODO: Verify that correct code was received
        self.proceedAndRegisterPhoneNumber(self.phoneNumberString())
    }
    
    // MARK: - TextField Customization
    
    func textFieldDidChange(sender: UITextField) {
        if (self.areaCodeField.isFirstResponder()) {
            if (self.areaCodeField.text?.characters.count >= 3) {
                self.threeNumberField.becomeFirstResponder()
            }
        }
        else if (self.threeNumberField.isFirstResponder()) {
            if (self.threeNumberField.text?.characters.count >= 3) {
                self.fourNumberField.becomeFirstResponder()
            }
        }
        else if (self.fourNumberField.isFirstResponder()) {
            if (self.fourNumberField.text?.characters.count >= 4) {
                self.fourNumberField.resignFirstResponder()
            }
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if (range.length + range.location > textField.text?.characters.count) {
            return false
        }
        
        let newLength: Int = (textField.text?.characters.count)! + string.characters.count - range.length
        if (textField == self.fourNumberField) {
            return newLength <= 4
        }
        else if (textField == self.codeTextField) {
            return newLength <= 6
        }
        else {
            return newLength <= 3
        }
    }
    
    func phoneNumberString() -> String {
        let areaCode: String = areaCodeField.text!
        let threeNumbers: String = threeNumberField.text!
        let fourNumbers: String = fourNumberField.text!
        return "\(areaCode)\(threeNumbers)\(fourNumbers)"
    }
    
    func proceedAndRegisterPhoneNumber(phoneNumber: String) {
        self.signupModel.newUser.phoneNumber = phoneNumber
        self.signupModel.moveToViewControllerAtIndex(Signup.Paging.ZipcodeEntryViewControllerIndex, pageDirection: .Forward)
    }

}
