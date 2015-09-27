//
//  MasterViewController.swift
//  Yahoo Digest
//
//  Copyright © 2015 Joshua Cox. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UIPageViewControllerDataSource {
	
	var pageViewController : UIPageViewController?
	var pageTitles : [String]?
	var pageDescriptions : [String]?
	var pageImages : [String]?
	
	override func viewDidLoad() {

		// Model
		pageTitles = ["Comprehensive", "Twice a day", "Definitive", "Reminders"]
		pageDescriptions = [
			"We collect the best pieces around the web and combine them into a story.",
			"Top stories delivered to you twice daily at times you choose.",
			"We surface the most important need-to-know news.",
			"Custom notifications timing for the morning and evening digest."
		]
		pageImages = ["Comprehensive.png", "Twice.png", "Color Wheel.png", "Clocks.png"]
		
		pageViewController = storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? UIPageViewController
		pageViewController?.dataSource = self
		
		let startingViewController : PageContentViewController = viewControllerAtIndex(0)!
		let viewControllers = [startingViewController]
		pageViewController?.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
		
		pageViewController!.view.frame = CGRectMake(0, 0, view.frame.width, view.frame.height-30)
		addChildViewController(pageViewController!)
		view.addSubview(pageViewController!.view)
		pageViewController?.didMoveToParentViewController(self)
	}
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
		
		guard var index : Int = (viewController as! PageContentViewController).pageIndex else {
			return nil
		}
		
		if index == 0 { return nil }
		index--
		
		return self.viewControllerAtIndex(index)
	}
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
		
		guard let _ = viewController as? PageContentViewController else {
			return nil
		}
		
		guard var index : Int = (viewController as! PageContentViewController).pageIndex else {
			return nil
		}
		
		index++
		if index == pageTitles?.count {
//			return storyboard?.instantiateViewControllerWithIdentifier("CustomizeItScreen")
			return nil
		}
		
		return self.viewControllerAtIndex(index)
	}
	
	func viewControllerAtIndex(index: Int) -> PageContentViewController? {
		if ((pageTitles!.count == 0) || (index >= pageTitles!.count)) {
			return nil
		}
		
		let pageContentViewController : PageContentViewController = 	storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! PageContentViewController
		pageContentViewController.imageFile = pageImages![index]
		pageContentViewController.titleText = pageTitles![index]
		pageContentViewController.descriptionText = pageDescriptions![index]
		pageContentViewController.pageIndex = index
		
		return pageContentViewController
	}
	
	func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
		return pageTitles!.count
	}
	
	func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
		return 0
	}

}



