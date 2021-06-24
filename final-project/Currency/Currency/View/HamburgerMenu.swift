//
//  HumburgerMenu.swift
//  Currency
//
//  Created by Petro Golishevskiy on 24.06.2021.
//

import Foundation
import UIKit

class HamburgerMenu: UIView {
    
    let router = Router.shared
    var bank: Bank?
    var view = UIView()
    var navigation: UINavigationController?

    var phoneButton = MenuButton(diameter: 60,
                                 imageName: "phone",
                                 tintColor: .grey,
                                 bgColor: .white)
    let locationButton = MenuButton(diameter: 60,
                                    imageName: "location",
                                    tintColor: .grey,
                                    bgColor: .white)
    let linkButton = MenuButton(diameter: 60,
                                imageName: "link",
                                tintColor: .grey,
                                bgColor: .white)
    var button = MenuButton(diameter: 60,
                            imageName: "menu2",
                            tintColor: .white,
                            bgColor: .green,
                            shadow: true)

    
    func addHamburgerMenu(bank: Bank?, view: UIView, navigationController: UINavigationController) {
        
        self.bank = bank
        self.view = view
        self.navigation = navigationController
        
        phoneButton.tag = 2
        locationButton.tag = 1
        linkButton.tag = 0
        button.tag = 3
        
        view.addSubview(phoneButton)
        view.addSubview(locationButton)
        view.addSubview(linkButton)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(menuClicked), for: .touchUpInside)
        phoneButton.addTarget(self, action: #selector(menuClicked), for: .touchUpInside)
        linkButton.addTarget(self, action: #selector(menuClicked), for: .touchUpInside)
        locationButton.addTarget(self, action: #selector(menuClicked), for: .touchUpInside)
        
        phoneButton.isHidden = true
        locationButton.isHidden = true
        linkButton.isHidden = true
        
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -19).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -19).isActive = true
        
        phoneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        phoneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -19).isActive = true
        
        locationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        locationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -19).isActive = true
        
        linkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        linkButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -19).isActive = true
    }
    
    func hidden(b: Bool) {
        if b {
            button.isHidden = true
            phoneButton.isHidden = true
            linkButton.isHidden = true
            locationButton.isHidden = true
        } else {
            button.isHidden = false
            phoneButton.isHidden = false
            linkButton.isHidden = false
            locationButton.isHidden = false
        }
    }
    
   @objc func menuClicked(sender: UIButton) {
        guard let bank = bank else { return }
        switch sender.tag {
        case 0:
            print("sender.tag - \(sender.tag)")
            router.toSafari(link: bank.webSite)
        case 1:
            print("sender.tag - \(sender.tag)")
            router.toMap(address: bank.city + " " + bank.street,
                         navigation: navigation)
        case 2:
            print("sender.tag - \(sender.tag)")
            router.toCall(number: bank.phone)
        case 3:
            print("sender.tag - \(sender.tag)")
            showMenu()
        default:
            print("default")
        }
    }
    
    func showMenu() {
        if phoneButton.isHidden == true {
            UIView.animate(withDuration: 0.3) {
                self.phoneButton.isHidden = false
                self.locationButton.isHidden = false
                self.linkButton.isHidden = false
                
                self.view.backgroundColor = .black
                self.view.subviews[0].alpha = 0.6
                
                self.phoneButton.transform = CGAffineTransform(translationX: .zero, y: -(self.phoneButton.frame.width + 12))
                self.locationButton.transform = CGAffineTransform(translationX: .zero, y: -((self.phoneButton.frame.width + 12) * 2))
                self.linkButton.transform = CGAffineTransform(translationX: .zero, y: -((self.phoneButton.frame.width + 12) * 3))
                
                self.button.setImage(UIImage(named: "close"), for: .normal)
                self.button.setImageTintColor(UIColor(hexFromString: "FFFFFF"))
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                
                self.view.backgroundColor = .clear
                self.view.subviews[0].alpha = 1
                
                self.phoneButton.transform = CGAffineTransform(translationX: .zero, y: (self.phoneButton.frame.width + 12))
                self.locationButton.transform = CGAffineTransform(translationX: .zero, y: ((self.phoneButton.frame.width + 12) * 2))
                self.linkButton.transform = CGAffineTransform(translationX: .zero, y: ((self.phoneButton.frame.width + 12) * 3))
                self.button.setImage(UIImage(named: "menu2"), for: .normal)
                self.button.setImageTintColor(UIColor(hexFromString: "FFFFFF"))
            } completion: { _ in
                self.phoneButton.isHidden = true
                self.locationButton.isHidden = true
                self.linkButton.isHidden = true
            }
        }
    } 
}
