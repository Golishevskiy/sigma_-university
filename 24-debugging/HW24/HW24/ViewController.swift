//
//  ViewController.swift
//  HW24
//
//  Created by Petro Golishevskiy on 12.06.2021.
//

import UIKit

class ViewController: UIViewController {

    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillArray()
    }
    
    private func fillArray() {
        for _ in 1...100 {
            let someString = randomString()
            array.append(someString)
        }
    }
    
    private func randomString() -> String {
        let randomInt = Int.random(in: 0..<20)
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_)(*?:%;№"
        return String((0..<randomInt).map{ _ in letters.randomElement()! })
    }
}

