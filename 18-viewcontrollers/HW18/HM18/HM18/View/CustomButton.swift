//
//  CustomButton.swift
//  HM18
//
//  Created by Petro Golishevskiy on 24.05.2021.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    @IBInspectable var numberLabel: String?
    @IBInspectable var letterLabel: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width / 2
        self.backgroundColor = .systemGray5
        self.addSubview(topLabel)
        self.addSubview(bottomLabel)
        topLabel.text = numberLabel
        bottomLabel.text = letterLabel
        layout()
    }
    
    open var topLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    open var bottomLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func layout() {
        
        if self.topLabel.text == "∗" || self.topLabel.text == "#" {
            topLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        } else {
            topLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.1).isActive = true
        }
        
        topLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottomLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: -5).isActive = true
    }
}
