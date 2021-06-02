//
//  AddContactTableViewController.swift
//  Contacts
//
//  Created by Petro Golishevskiy on 02.06.2021.
//

import UIKit

class AddContactTableViewController: UITableViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var showContact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        setupShowViewContact()
    }
    
    private func setupShowViewContact() {
        if let contact = showContact {
            saveButton.isEnabled = false
            firstNameTextField.text = contact.firstName
            secondNameTextField.text = contact.secondName
            phoneTextField.text = contact.phone
            self.title = "Contact"
            
            firstNameTextField.addTarget(self,
                                         action: #selector(textFieldDidChange),
                                         for: .editingChanged)
            secondNameTextField.addTarget(self,
                                          action: #selector(textFieldDidChange),
                                          for: .editingChanged)
            emailTextField.addTarget(self,
                                     action: #selector(textFieldDidChange),
                                     for: .editingChanged)
            phoneTextField.addTarget(self,
                                     action: #selector(textFieldDidChange),
                                     for: .editingChanged)
        }
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        saveButton.isEnabled = true
    }
    
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        if checkFill() {
            guard let fName = self.firstNameTextField.text else { return }
            guard let sName = self.secondNameTextField.text else { return }
            
            let fileManager = FileManager.default
            var directory = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                .userDomainMask,
                                                                true)[0] as String
            
            directory.append("/Contacts")
            let path = directory.appending("/\(UUID().uuidString).plist")
            
            if(!fileManager.fileExists(atPath: path)){
                let data : [String: String] = [
                    "firstName": fName,
                    "secondName": sName,
                    "phone": (phoneTextField.text != "") ? phoneTextField.text! : "",
                    "email": (emailTextField.text != "") ? emailTextField.text! : "",
                    "photo": ""
                ]
                
                let someData = NSDictionary(dictionary: data)
                let isWritten = someData.write(toFile: path, atomically: true)
                print("is the file created: \(isWritten)")
            } else {
                print("file exists")
            }
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func addPhotoButton(_ sender: UIButton) {
        print("addPhotoButton")
    }
}


