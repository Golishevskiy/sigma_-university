//
//  UIButton+RigthImage.swift
//  HW20
//
//  Created by Petro Golishevskiy on 31.05.2021.
//

import UIKit

extension UIButton {
   func addRightImage(image: UIImage, offset: CGFloat) {
       self.setImage(image, for: .normal)
       self.imageView?.translatesAutoresizingMaskIntoConstraints = false
       self.imageView?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
       self.imageView?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -offset).isActive = true
   }
}
