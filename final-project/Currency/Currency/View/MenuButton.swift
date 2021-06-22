//
//  SharedButton.swift
//  Currency
//
//  Created by Petro Golishevskiy on 19.06.2021.
//

import UIKit

enum TintColor: String {
    case white = "FFFFFF"
    case grey = "878A8D"
}

enum BgColor: String {
    case white = "FFFFFF"
    case green = "26BA67"
}

class MenuButton: UIButton {
    
    let label: UILabel = {
        let label = UILabel()
        label.tintColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(diameter: Int, imageName: String, tintColor: TintColor, bgColor: BgColor, shadow: Bool = false) {
        super.init(frame: .zero)
        setupButton(diameter: CGFloat(diameter),
                    image: imageName,
                    tintColorImage: tintColor.rawValue,
                    bgColor: bgColor.rawValue,
                    shadow: shadow)
    }
    
    private func setupButton(diameter: CGFloat,
                             image: String,
                             tintColorImage: TintColor.RawValue,
                             bgColor: BgColor.RawValue,
                             shadow: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // set image
        let image = UIImage(named: image)
        self.setImage(image, for: .normal)
        self.setImageTintColor(UIColor(hexFromString: tintColorImage))
        self.backgroundColor = UIColor(hexFromString: bgColor)
        
        // corner Radius
        self.layer.cornerRadius  = diameter / 2
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        self.widthAnchor.constraint(equalToConstant: diameter).isActive = true
        self.heightAnchor.constraint(equalToConstant: diameter).isActive = true
        shadow ? setShadow() : nil
    }
    
    private func setShadow() {
        self.layer.shadowOffset = CGSize(width: 0, height: 16)
        self.layer.shadowColor = UIColor(hexFromString: "D8D8D8").cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 6
        self.layer.masksToBounds = false
    }
}
