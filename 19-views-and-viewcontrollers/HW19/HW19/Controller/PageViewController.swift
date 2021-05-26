//
//  PageViewController.swift
//  HW19
//
//  Created by Petro Golishevskiy on 26.05.2021.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        self.dataSource = self
        self.delegate = self
        
        let page1 = storyboard?.instantiateViewController(withIdentifier: "alarmID")
        let page2 = storyboard?.instantiateViewController(withIdentifier: "watchID")
        
        guard let vc1 = page1 else { return }
        guard let vc2 = page2 else { return }
        
        pages.append(vc1)
        pages.append(vc2)
        
        setViewControllers([vc1], direction: .forward, animated: false, completion: nil)
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.topItem?.title = "Будильник"
        
        let leftButton = UIBarButtonItem(title: "Змінити",
                                         style: .plain,
                                         target: self,
                                         action: nil)
        leftButton.tintColor = .orange
        self.navigationItem.leftBarButtonItem  = leftButton
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add,
                                          target: self,
                                          action: nil)
        rightButton.tintColor = .orange
        self.navigationItem.rightBarButtonItem  = rightButton
    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = pages.firstIndex(of: viewController) {
            if index > 0 {
                return pages[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = pages.firstIndex(of: viewController) {
            if index < pages.count - 1 {
                return pages[index + 1]
            }
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
}

