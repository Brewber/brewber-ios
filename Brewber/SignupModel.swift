//
//  ViewController.swift
//  PageViewTest
//
//  Created by Alex Brashear on 1/17/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

struct Signup {
    struct Paging {
        static let EmailSignupViewControllerIndex: Int = 0
        static let PhoneVerificationViewControllerIndex: Int = 1
        static let ZipcodeEntryViewControllerIndex: Int = 2
        
        static let SignupNumberOfPages: Int = 3
    }
}

class SignupModel: UIViewController, UIPageViewControllerDataSource {
    
    let pageControlOffset: CGFloat = 40
    var pageViewController: UIPageViewController!
    var newUser: BrewberUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPageViewController()
        self.setupNavigationBar()
        self.disablePageScrolling()
        self.setupPageControl()
        self.view.backgroundColor = UIColor.gray246Color()
        self.newUser = BrewberUser()
    }
    
    private func setupPageViewController() {
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        let startVC = self.viewControllerAtIndex(Signup.Paging.EmailSignupViewControllerIndex) as! EmailSignupViewController
        let viewControllers = NSArray(object: startVC) as! [UIViewController]
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - pageControlOffset)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    private func setupNavigationBar() {
        self.navigationController!.navigationBar.barTintColor = UIColor.vividRedColor()
        self.navigationController?.navigationBar.topItem?.title = "Sign Up"
        let closeButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "closeButtonPressed")
        closeButton.tintColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = closeButton
        self.navigationController?.navigationBar.translucent = false
        
        let titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
    }
    
    func closeButtonPressed() {
        self.newUser = nil
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func setupPageControl() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.vividRedColor()
        pageControl.backgroundColor = UIColor.gray246Color()
    }
    
    private func disablePageScrolling() {
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
        if (index == Signup.Paging.EmailSignupViewControllerIndex) {
            let vc: EmailSignupViewController = self.storyboard?.instantiateViewControllerWithIdentifier("EmailSignupViewController") as! EmailSignupViewController
            vc.signupModel = self
            return vc
        }
        else if (index == Signup.Paging.PhoneVerificationViewControllerIndex) {
            let vc: PhoneVerificationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PhoneVerificationViewController") as! PhoneVerificationViewController
            vc.signupModel = self
            return vc
        }
        else if (index == Signup.Paging.ZipcodeEntryViewControllerIndex) {
            let vc: ZipcodeBirthdayViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ZipcodeBirthdayViewController") as! ZipcodeBirthdayViewController
            vc.signupModel = self
            return vc
        }
        else {
            print("Incorrect index \(index)")
            return EmailSignupViewController()
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if (viewController.isKindOfClass(EmailSignupViewController)) {
            return nil
        }
        else if (viewController.isKindOfClass(PhoneVerificationViewController)) {
            return self.viewControllerAtIndex(Signup.Paging.EmailSignupViewControllerIndex)
        }
        else if (viewController.isKindOfClass(ZipcodeBirthdayViewController)) {
            return self.viewControllerAtIndex(Signup.Paging.PhoneVerificationViewControllerIndex)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if (viewController.isKindOfClass(EmailSignupViewController)) {
            return self.viewControllerAtIndex(Signup.Paging.PhoneVerificationViewControllerIndex)
        }
        else if (viewController.isKindOfClass(PhoneVerificationViewController)) {
            return self.viewControllerAtIndex(Signup.Paging.ZipcodeEntryViewControllerIndex)
        }
        else if (viewController.isKindOfClass(ZipcodeBirthdayViewController)) {
            return nil
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return Signup.Paging.SignupNumberOfPages
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        let viewController: UIViewController = self.pageViewController.viewControllers![0]
        if (viewController.isKindOfClass(EmailSignupViewController)) {
            return Signup.Paging.EmailSignupViewControllerIndex
        }
        else if (viewController.isKindOfClass(PhoneVerificationViewController)) {
            return Signup.Paging.PhoneVerificationViewControllerIndex
        }
        else if (viewController.isKindOfClass(ZipcodeBirthdayViewController)) {
            return Signup.Paging.ZipcodeEntryViewControllerIndex
        }
        return 0
    }
}

