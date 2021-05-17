//
//  Task2ViewController.swift
//  HW17_2
//
//  Created by Petro Golishevskiy on 17.05.2021.
//

import UIKit

class Task2ViewController: UIViewController {
    
    @IBOutlet weak var catImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }
    
    private func setupImageView() {
        catImageView.image = #imageLiteral(resourceName: "cat")
        catImageView.contentMode = .scaleAspectFit
        catImageView.translatesAutoresizingMaskIntoConstraints = false
    }
}
