//
//  StatusView.swift
//  Currency
//
//  Created by Petro Golishevskiy on 17.06.2021.
//

import Foundation
import UIKit

class StatusView {
    
    var present = true {
        didSet {
            switch present {
            case true:
                UIView.animate(withDuration: 0.3) {
                    self.loaderView.transform = CGAffineTransform(translationX: 0, y: -60)
                    self.loaderView.isHidden = false
                }
            case false:
                UIView.animate(withDuration: 0.3) {
                    self.loaderView.transform = CGAffineTransform(translationX: 0, y: 60)
                } completion: { (bool) in
                    self.loaderView.isHidden = true
                }
            }
        }
    }
    
    private let loaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Updating content..."
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupView(superView: UIView) {
        loaderView.addSubview(statusLabel)
        superView.addSubview(loaderView)
        
        // loaderView
        loaderView.topAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        loaderView.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        loaderView.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        loaderView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // statuslabel
        statusLabel.leadingAnchor.constraint(equalTo: loaderView.leadingAnchor, constant: 16).isActive = true
        statusLabel.centerYAnchor.constraint(equalTo: loaderView.centerYAnchor).isActive = true
    }
}
