//
//  CustomAlert.swift
//  CustomAlert
//
//  Created by Petro Golishevskiy on 20.06.2021.
//

import UIKit

class CustomAlert: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXib()
    }

    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupXib()
    }
    
    func setupXib() {
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        addSubview(view)
    }
}
