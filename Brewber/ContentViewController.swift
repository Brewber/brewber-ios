//
//  ContentViewController.swift
//  PageViewTest
//
//  Created by Alex Brashear on 1/17/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {    
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var facebookLabel: UILabel!
    
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var emailButton: UIButton!
    
    var modelViewController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray246Color()
        self.setupButtonCorners(emailButton)
        self.setupButtonCorners(facebookButton)
    }
    
    func setupButtonCorners(button: UIButton) {
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
    }
    
    // MARK: - IBActions
    
    @IBAction func facebookButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func emailButtonPressed(sender: AnyObject) {
        self.modelViewController.moveToViewControllerAtIndex(1, pageDirection: UIPageViewControllerNavigationDirection.Forward)
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
