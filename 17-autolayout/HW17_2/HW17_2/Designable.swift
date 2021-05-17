//
//  Designeble.swift
//  HW17_2
//
//  Created by Petro Golishevskiy on 17.05.2021.
//

import Foundation
import UIKit

@IBDesignable extension UINavigationController {
    @IBInspectable var barTintColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            navigationBar.barTintColor = uiColor
        }
        get {
            guard let color = navigationBar.barTintColor else { return nil }
            return color
        }
    }
}

@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 1 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
