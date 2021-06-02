//
//  Alert.swift
//  Contacts
//
//  Created by Petro Golishevskiy on 02.06.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title : String, massage : String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
