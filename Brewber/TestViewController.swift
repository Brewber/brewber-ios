//
//  TestViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/17/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var pageViewController: UIPageViewController!
    var firstViewController: ContentViewController!
    var modelViewController: ViewController!

    @IBOutlet var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray246Color()
        self.pageViewController = self.parentViewController as! UIPageViewController
        self.setupContinueButton()
    }

    func setupContinueButton() {
        self.continueButton.titleLabel!.text = "Continue"
        self.continueButton.layer.cornerRadius = 5
        self.continueButton.clipsToBounds = true
    }
    
    @IBAction func continueButtonPressed(sender: AnyObject) {
        self.modelViewController.moveToViewControllerAtIndex(2, pageDirection: .Forward)
    }
}
