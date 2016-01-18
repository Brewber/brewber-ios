//
//  ViewController.swift
//  PageViewTest
//
//  Created by Alex Brashear on 1/17/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    let SocialSignupViewControllerIndex: Int = 0
    let EmailSignupViewControllerIndex: Int = 1
    let PhoneVerificationViewControllerIndex: Int = 2
    let ZipcodeEntryViewControllerIndex: Int = 3
    
    let pageControlOffset: CGFloat = 40
    var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPageViewController()
        self.setupNavigationBar()
        self.disablePageScrolling()
        self.setupPageControl()
        self.view.backgroundColor = UIColor.gray246Color()
    }
    
    func setupPageViewController() {
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        let startVC = self.viewControllerAtIndex(0) as! ContentViewController
        let viewControllers = NSArray(object: startVC) as! [UIViewController]
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - pageControlOffset)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    func setupNavigationBar() {
        self.navigationController!.navigationBar.barTintColor = UIColor.vividRedColor()
        self.navigationController?.navigationBar.topItem?.title = "Sign Up"
        let closeButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "doneButtonPressed")
        closeButton.tintColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = closeButton
        self.navigationController?.navigationBar.translucent = false
        
        let titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
    }
    
    func doneButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setupPageControl() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.vividRedColor()
        pageControl.backgroundColor = UIColor.gray246Color()
    }
    
    func disablePageScrolling() {
        for view in self.pageViewController.view.subviews {
            if view is UIScrollView {
                let scrollView = view as! UIScrollView
                scrollView.scrollEnabled = false;
            } else {
                print("UIScrollView does not exist on this View")
            }
        }
    }
    
    
    func moveToViewControllerAtIndex(index: Int, pageDirection: UIPageViewControllerNavigationDirection) {
        let vc = self.viewControllerAtIndex(index)
        self.pageViewController.setViewControllers([vc], direction:pageDirection, animated:true, completion:nil)
    }
    
    func viewControllerAtIndex(index: Int) -> UIViewController {
        if (index == SocialSignupViewControllerIndex) {
            let vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
            vc.modelViewController = self
            return vc
        }
        else if (index == EmailSignupViewControllerIndex) {
            let vc: TestViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TestViewController") as! TestViewController
            vc.modelViewController = self
            return vc
        }
        else if (index == PhoneVerificationViewControllerIndex) {
            let vc: PhoneVerificationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PhoneVerificationViewController") as! PhoneVerificationViewController
            vc.modelViewController = self
            return vc
        }
        else if (index == ZipcodeEntryViewControllerIndex) {
            let vc: ZipcodeBirthdayViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ZipcodeBirthdayViewController") as! ZipcodeBirthdayViewController
            vc.modelViewController = self
            return vc
        }
        else {
            print("Incorrect index \(index)")
            return ContentViewController()
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if (viewController.isKindOfClass(ContentViewController)) {
            return nil
        }
        else if (viewController.isKindOfClass(TestViewController)) {
            return self.viewControllerAtIndex(SocialSignupViewControllerIndex)
        }
        else if (viewController.isKindOfClass(PhoneVerificationViewController)) {
            return self.viewControllerAtIndex(EmailSignupViewControllerIndex)
        }
        else if (ViewController.isKindOfClass(ZipcodeBirthdayViewController)) {
            return self.viewControllerAtIndex(PhoneVerificationViewControllerIndex)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if (viewController.isKindOfClass(ContentViewController)) {
            return self.viewControllerAtIndex(EmailSignupViewControllerIndex)
        }
        else if (viewController.isKindOfClass(TestViewController)) {
            return self.viewControllerAtIndex(PhoneVerificationViewControllerIndex)
        }
        else if (viewController.isKindOfClass(PhoneVerificationViewController)) {
            return self.viewControllerAtIndex(ZipcodeEntryViewControllerIndex)
        }
        else if (ViewController.isKindOfClass(ZipcodeBirthdayViewController)) {
            return nil
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 4
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        let viewController: UIViewController = self.pageViewController.viewControllers![0]
        if (viewController.isKindOfClass(ContentViewController)) {
            return SocialSignupViewControllerIndex
        }
        else if (viewController.isKindOfClass(TestViewController)) {
            return EmailSignupViewControllerIndex
        }
        else if (viewController.isKindOfClass(PhoneVerificationViewController)) {
            return PhoneVerificationViewControllerIndex
        }
        else if (viewController.isKindOfClass(ZipcodeBirthdayViewController)) {
            return ZipcodeEntryViewControllerIndex
        }
        return 0
    }
}

