//
//  testVCViewController.swift
//  Currency
//
//  Created by Petro Golishevskiy on 27.05.2021.
//

import UIKit
import Foundation

class testVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func doneButton(_ sender: StartButton) {
//        let startViewController = storyboard?.instantiateViewController(withIdentifier: "viewController") as! ViewController
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
//
//        self.navigationController?.pushViewController(newViewController, animated: true)
        
        UserDefaults.standard.setValue(true, forKey: "isOnboardingDone")
        print(UserDefaults.standard.bool(forKey: "isOnboardingDone"))
//        navigationController?.pushViewController(startViewController, animated: true)
        print(sender.titleLabel?.text)
    }
}

