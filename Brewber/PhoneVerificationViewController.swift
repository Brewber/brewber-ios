//
//  PhoneVerificationViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/18/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class PhoneVerificationViewController: UIViewController {

    @IBOutlet var codeTextField: UITextField!
    @IBOutlet var fourNumberField: UITextField!
    @IBOutlet var threeNumberField: UITextField!
    @IBOutlet var areaCodeField: UITextField!
    @IBOutlet var sendCodeButton: UIButton!
    @IBOutlet var verifyButton: UIButton!
    
    var modelViewController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        self.verifyButton.hidden = false
        self.codeTextField.hidden = false
    }
    
    @IBAction func VerifyButtonPressed(sender: AnyObject) {
        self.modelViewController.moveToViewControllerAtIndex(3, pageDirection: .Forward)
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
