//
//  DoneButton.swift
//  Currency
//
//  Created by Petro Golishevskiy on 27.05.2021.
//

import UIKit

class StartButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        backgroundColor = UIColor(named: "currencyBlue")
        setTitle("РОЗПОЧАТИ", for: .normal)
        titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        layer.cornerRadius = self.frame.height / 2
        layer.shadowColor = UIColor(hexFromString: "99A3AF", alpha: CGFloat(50)).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 4.0
        layer.shadowRadius = 6
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
