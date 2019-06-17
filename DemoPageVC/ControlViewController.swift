//
//  ControlViewController.swift
//  DemoPageVC
//
//  Created by Apple on 01/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var PageViewController: UIPageViewController?
    
    var arrPageTitle: [String] = ["This is The App Guruz", "This is Table Tennis 3D"]
    var arrPagePhoto: [String] = ["1", "2"]
    
    var  pendingIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        self.pageControl.numberOfPages = arrPagePhoto.count
        
        createPageViewController()
        
    }
    
    
func createPageViewController() {
    
    let pageController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
    
    pageController.dataSource = self
    pageController.delegate = self
    
    if arrPagePhoto.count > 0 {
        
        pageController.setViewControllers([getViewControllerAtIndex(index: 0)], direction: .forward, animated: true, completion: nil)
}
    
    //assign properties of page controller
PageViewController = pageController
    
    
self.addChild(PageViewController!)
    
self.view.addSubview(PageViewController!.view)
    
    PageViewController!.didMove(toParent: self)

    self.view.bringSubviewToFront(pageControl)
    
    
    }
    
    func getViewControllerAtIndex(index: Int) -> PageContentViewController
    {
    
        let pvc = self.storyboard?.instantiateViewController(withIdentifier: "PageContentViewController") as! PageContentViewController
        pvc.strTitle
            = "\(arrPageTitle[index])"
        pvc.strPhotoName = "\(arrPagePhoto[index])"
        pvc.pageIndex = index
        
        return pvc
    }
    
}

    extension ControlViewController: UIPageViewControllerDelegate,UIPageViewControllerDataSource {
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            let ContentVC = viewController as! PageContentViewController
            if ContentVC.pageIndex > 0{
                return getViewControllerAtIndex(index:ContentVC.pageIndex-1)
            }
            return nil
        
        }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let ContentVC = viewController as! PageContentViewController
        if (ContentVC.pageIndex + 1 < arrPagePhoto.count){
            return getViewControllerAtIndex(index: ContentVC.pageIndex+1)
        }
        return nil
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
    pendingIndex = (pendingViewControllers.first as! PageContentViewController).pageIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let index = pendingIndex {
                self.pageControl.currentPage = index
            }
    
  
        }


    }

}
