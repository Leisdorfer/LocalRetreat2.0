//
//  ViewController.swift
//  LocalRetreat - Master
//
//  Created by Lauren Eisdorfer on 7/4/16.
//  Copyright © 2016 Lauren Eisdorfer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

   
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    var pageDescriptions: NSArray!
    
    
    @IBOutlet weak var join: UIButton!
    
    
    override func viewDidLoad() {
        
        self.pageTitles = NSArray(objects: "City Exploring", "Trip Planning", "Local Bonding")
        self.pageDescriptions = NSArray(objects: "Discover events and activities in your city as other locals experience them", "Learn about what to do and what to see from locals", "Connect with locals and develop friendships while you’re traveling")
        self.pageImages = NSArray(objects: "explore", "plan", "connect")
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        let startVC = self.viewControllerAtIndex(0) as ContentViewController
        let viewControllers = NSArray(object: startVC)
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRectMake(0, 60, self.view.frame.width, self.view.frame.size.height
        - 60)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
  
    func viewControllerAtIndex(index: Int) -> ContentViewController{
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)){
            return ContentViewController()
        }
        let vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        vc.imageFile = self.pageImages[index] as! String
        vc.titleText = self.pageTitles[index] as! String
        vc.descriptionText = self.pageDescriptions[index] as! String
        vc.pageIndex = index
        return vc
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if (index == 0) || index == NSNotFound{
            return nil
        }
        index-=1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if (index == NSNotFound){
            return nil
        }
        index+=1
        if (index == self.pageTitles.count){
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

