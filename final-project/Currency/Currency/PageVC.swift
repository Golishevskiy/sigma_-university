//
//  PageVC.swift
//  Currency
//
//  Created by Petro Golishevskiy on 27.05.2021.
//

import UIKit

class PageVC: UIPageViewController {

    private var pages = [UIViewController]()
    let userDefault = UserDefaults.standard
    
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
    
        setViewControllers([vc1], direction: .forward, animated: false, completion: nil)
        constraint()
    }
    
    func constraint() {
        // button
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        // pageControl
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -30).isActive = true
    }
    
    @objc func buttonPressed() {
        print(UserDefaults.standard.bool(forKey: "didSee"))
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let objSomeViewController = storyBoard.instantiateViewController(withIdentifier: "firstViewController") as! ViewController
        // 1
        self.navigationController?.pushViewController(objSomeViewController, animated: true)
        // 2
        self.present(objSomeViewController, animated:true, completion:nil)
        
    }
}

extension PageVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = pages.firstIndex(of: viewController) {
            pageControl.currentPage = index
            if index > 0 {
                return pages[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = pages.firstIndex(of: viewController) {
            pageControl.currentPage = index
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
