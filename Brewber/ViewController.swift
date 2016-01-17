//
//  ViewController.swift
//  PageViewTest
//
//  Created by Alex Brashear on 1/17/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    
    var pageTitles: NSArray!
    
    var pageImages: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.pageTitles = NSArray(objects: "Explore", "Today Widget")
        
        self.pageImages = NSArray(objects: "page1", "page2")
        
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        
        let startVC = self.viewControllerAtIndex(0) as ContentViewController
        
        let viewControllers = NSArray(object: startVC) as! [UIViewController]
        
        
        
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
        
        
        
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 60)
        
        
        
        self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    func viewControllerAtIndex(index: Int) -> ContentViewController {
        
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            
            return ContentViewController()
            
        }
        
        
        
        let vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        
        
        
        vc.imageFile = self.pageImages[index] as! String
        
        vc.titleText = self.pageTitles[index] as! String
        
        vc.pageIndex = index
        return vc
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        
        var index = vc.pageIndex as Int
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        index--
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ContentViewController
        
        var index = vc.pageIndex as Int
        if (index == NSNotFound) {
            return nil
        }
        index++
        if (index == self.pageTitles.count) {
            return nil
        }
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

