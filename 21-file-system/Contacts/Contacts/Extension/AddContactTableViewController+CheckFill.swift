//
//  Add+CheckFill.swift
//  Contacts
//
//  Created by Petro Golishevskiy on 02.06.2021.
//

import Foundation
import UIKit

extension AddContactTableViewController {
    func checkFill() -> Bool {
        if checkFirstName() && checkSecondName() {
            return true
        } else {
            return false
        }
    }
    
    func checkFirstName() -> Bool {
        if firstNameTextField.text != "" {
            return true
        } else {
            showAlert(title: "It cannot be saved",
                      massage: "Please, enter a first name")
            return false
        }
    }
    
    func checkSecondName() -> Bool {
        if secondNameTextField.text != "" {
            return true
        } else {
            showAlert(title: "It cannot be saved",
                      massage: "Please, enter a second name")
            return false
        }
    }
}
