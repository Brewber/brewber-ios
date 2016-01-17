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

    @IBOutlet var firstPageButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstPageButton.titleLabel?.text = "FIRST PAGE"
        self.pageViewController = self.parentViewController as! UIPageViewController
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        self.modelViewController.moveToViewControllerAtIndex(0, pageDirection: UIPageViewControllerNavigationDirection.Reverse)
    }
}
