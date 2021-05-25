//
//  AddContactViewController.swift
//  HM18
//
//  Created by Petro Golishevskiy on 23.05.2021.
//

import UIKit

class AddContactViewController: UITableViewController {
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        if let text = phoneNumber.text {
            print("saved \(text)")
        }
        dismiss(animated: true, completion: nil)
    }
}
