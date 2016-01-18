//
//  ViewController.swift
//  PageViewTest
//
//  Created by Alex Brashear on 1/17/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    let pageControlOffset: CGFloat = 60
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageTitles = NSArray(objects: "Explore", "Today Widget")
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        let startVC = self.viewControllerAtIndex(0) as! ContentViewController
        let viewControllers = NSArray(object: startVC) as! [UIViewController]
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - pageControlOffset)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        self.disablePageScrolling()
        self.setupPageControl()
    }
    
    func setupPageControl() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.blackColor()
        pageControl.backgroundColor = UIColor.whiteColor()
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
        
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            return ContentViewController()
        }
        if (index == 0) {
            let vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
            vc.modelViewController = self
            vc.titleText = self.pageTitles[index] as! String
            return vc
        }
        else {
            let vc: TestViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TestViewController") as! TestViewController
            vc.modelViewController = self
            return vc
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if (viewController.isKindOfClass(ContentViewController)) {
            // this is the first vc
            return nil
        }
        else if (viewController.isKindOfClass(TestViewController)) {
            // this is the last vc
            return self.viewControllerAtIndex(0)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if (viewController.isKindOfClass(ContentViewController)) {
            // this is the first vc
            return self.viewControllerAtIndex(1)
        }
        else if (viewController.isKindOfClass(TestViewController)) {
            // this is the last vc
            return nil
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        let viewController: UIViewController = self.pageViewController.viewControllers![0]
        if (viewController.isKindOfClass(ContentViewController)) {
            return 0
        }
        else if (viewController.isKindOfClass(TestViewController)) {
            return 1
        }
        return 0
    }
}
