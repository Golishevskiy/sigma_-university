//
//  PageVC.swift
//  Currency
//
//  Created by Petro Golishevskiy on 27.05.2021.
//

import UIKit

class PageVC: UIPageViewController {

    private var pages = [UIViewController]()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(origin: CGPoint(x: 50, y: 300),
                                                      size: CGSize(width: view.frame.width / 3, height: 20)))
        pageControl.numberOfPages = pages.count
        pageControl.backgroundColor = .red
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Network.shared.getData { (exchangers) in
            exchangers.forEach { (exchanger) in
                print(exchanger.name)
            }
        }
        
        let page1 = storyboard?.instantiateViewController(withIdentifier: "firstScreen")
        let page2 = storyboard?.instantiateViewController(withIdentifier: "secondScreen")
        let page3 = storyboard?.instantiateViewController(withIdentifier: "thirdScreen")

        dataSource = self
        delegate = self
        
        guard let vc1 = page1 else { return }
        guard let vc2 = page2 else { return }
        guard let vc3 = page3 else { return }
        
        pages.append(vc1)
        pages.append(vc2)
        pages.append(vc3)
//        constraint()
        
        setViewControllers([vc1], direction: .forward, animated: false, completion: nil)
    }
    
    func constraint() {
//        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
//        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension PageVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
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
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
