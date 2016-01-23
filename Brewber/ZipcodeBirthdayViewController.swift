//
//  ZipcodeBirthdayViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/18/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class ZipcodeBirthdayViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var zipcodeTextField: UITextField!
    @IBOutlet var dayTextField: UITextField!
    @IBOutlet var monthTextField: UITextField!
    @IBOutlet var signupButton: UIButton!
    
    let invalidBirthdayMessage = "Invalid birthday, please enter a valid birthday"
    let invalidZipcodeMessage = "Invalid zipcode, please enter a valid zipcode"
    
    var signupModel: SignupModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray246Color()
        self.dayTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: .EditingChanged)
        self.dayTextField.delegate = self
        self.monthTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: .EditingChanged)
        self.monthTextField.delegate = self
        self.zipcodeTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: .EditingChanged)
        self.zipcodeTextField.delegate = self
        
        self.signupButton.layer.cornerRadius = 5
        self.signupButton.clipsToBounds = true
    }
    
    func textFieldDidChange(sender: UITextField) {
        if (self.monthTextField.isFirstResponder()) {
            if (self.monthTextField.text?.characters.count >= 2) {
                self.dayTextField.becomeFirstResponder()
            }
        }
        else if (self.dayTextField.isFirstResponder()) {
            if (self.dayTextField.text?.characters.count >= 2) {
                self.zipcodeTextField.becomeFirstResponder()
            }
        }
        else if (self.zipcodeTextField.isFirstResponder()) {
            if (self.zipcodeTextField.text?.characters.count >= 5) {
                self.zipcodeTextField.resignFirstResponder()
            }
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if (range.length + range.location > textField.text?.characters.count) {
            return false
        }
        
        let newLength: Int = (textField.text?.characters.count)! + string.characters.count - range.length
        if (textField == self.zipcodeTextField) {
            return newLength <= 5
        }
        else {
            return newLength <= 2
        }
    }
    
    @IBAction func signupButtonPressed(sender: AnyObject) {
        let zipcode: String = zipcodeTextField.text!
        let birthMonth: String = monthTextField.text!
        let birthDay: String = dayTextField.text!
        
        if (!self.isValidBirthday(birthMonth, day: birthDay)) {
            // Display Birthday error
        }
        else if (!self.isValidZipcode(zipcode)) {
            // Display zipcode error
        }
        else {
            // signup the user
            BrewberAuth.authController.signupUser(self.signupModel.newUser, completion: { (success, error) -> () in
                if (success) {
                    self.navigateToHomeScreen()
                }
                else {
                    print(error?.code)
                    print(error?.localizedDescription)
                    print(error?.localizedFailureReason)
                }
            })
        }
    }
    
    func isValidBirthday(month: String, day: String) -> Bool {
        var validBirthday: Bool = false
        
        let monthInteger: Int? = Int(month)
        let dayInteger: Int? = Int(day)
        
        if (monthInteger != nil && dayInteger != nil) {
            if (monthInteger <= 12 && dayInteger <= 31 && monthInteger >= 0 && dayInteger >= 0) {
                validBirthday = true
            }
        }
        
        return validBirthday
    }
    
    func isValidZipcode(zipcode: String) -> Bool {
        if (zipcode.characters.count != 5) {
            return false
        }
        
        let zipcodeInteger: Int? = Int(zipcode)
        return zipcodeInteger != nil
    }
    
    
    // MARK: - Navigation
    
    func navigateToHomeScreen() {
        
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
