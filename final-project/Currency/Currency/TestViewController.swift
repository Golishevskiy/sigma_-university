//
//  TestViewController.swift
//  Currency
//
//  Created by Petro Golishevskiy on 19.06.2021.
//

import UIKit

class TestViewController: UIViewController {
    

    


    override func viewDidLoad() {
        super.viewDidLoad()
        let button = SharedButton(diameter: 60, imageName: "menu2", tintColor: .white, bgColor: .green)
        view.addSubview(button)
                
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -19).isActive = true

    }
}
