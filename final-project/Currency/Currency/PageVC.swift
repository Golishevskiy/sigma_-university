//
//  PageVC.swift
//  Currency
//
//  Created by Petro Golishevskiy on 27.05.2021.
//

import UIKit

class PageVC: UIPageViewController {
    
    
    private let userDefault = UserDefaults.standard
    
    private let pages: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let page1 = storyboard.instantiateViewController(withIdentifier: "firstScreen")
        let page2 = storyboard.instantiateViewController(withIdentifier: "secondScreen")
        let page3 = storyboard.instantiateViewController(withIdentifier: "thirdScreen")
        return [page1, page2, page3]
    }()
    
    let startButton: StartButton = {
        let button = StartButton(frame: CGRect(origin: .zero,
                                               size: CGSize(width: 250, height: 60)))
        button.addTarget(nil, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(origin: .zero, size: CGSize(width: 50,
                                                                                  height: 10)))
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = UIColor(hexFromString: "#9B9B9B")
        pageControl.currentPageIndicatorTintColor = UIColor(hexFromString: "4A90E2")
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(startButton)
        view.addSubview(pageControl)
        
        dataSource = self
        delegate = self
        
        setViewControllers([pages[0]],
                           direction: .forward,
                           animated: false,
                           completion: nil)
        constraint()
    }
    
    func constraint() {
        // button
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                            constant: -60).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        // pageControl
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: startButton.topAnchor,
                                            constant: -30).isActive = true
    }
    
    @objc func buttonPressed() {
        print(UserDefaults.standard.bool(forKey: "didSee"))
        
        self.dismiss(animated: true) {
            UserDefaults.standard.setValue(true, forKey: "didSee")
        }
    }
}

extension PageVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = pages.firstIndex(of: viewController) {
            pageControl.currentPage = index
            if index > 0 {
                return pages[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = pages.firstIndex(of: viewController) {
            pageControl.currentPage = index
            if index < pages.count - 1 {
                return pages[index + 1]
            }
        }
        return nil
    }
}
