//
//  ViewController+Onboarding.swift
//  Currency
//
//  Created by Petro Golishevskiy on 23.06.2021.
//

import Foundation
import UIKit

extension ViewController {
    func presentOnboarding() {
        if !UserDefaults.standard.bool(forKey: "didSee") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "PageVC") as! PageVC
            viewController.modalPresentationStyle = .fullScreen
            viewController.modalTransitionStyle = .flipHorizontal
            present(viewController, animated: true, completion: nil)
        }
    }
}
