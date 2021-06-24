//
//  UIButton+ImageTintColor.swift
//  Currency
//
//  Created by Petro Golishevskiy on 19.06.2021.
//

import UIKit

extension UIButton{
    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }
}
