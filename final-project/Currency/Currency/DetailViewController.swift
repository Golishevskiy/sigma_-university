//
//  DetailViewController.swift
//  Currency
//
//  Created by Petro Golishevskiy on 18.06.2021.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var bank: Exchanger?
    
    let phoneButton = SharedButton(diameter: 60,
                                   imageName: "phone",
                                   tintColor: .grey,
                                   bgColor: .white)
    let locationButton = SharedButton(diameter: 60,
                                      imageName: "location",
                                      tintColor: .grey,
                                      bgColor: .white)
    let linkButton = SharedButton(diameter: 60,
                                  imageName: "link",
                                  tintColor: .grey,
                                  bgColor: .white)
    let button = SharedButton(diameter: 60,
                              imageName: "menu2",
                              tintColor: .white,
                              bgColor: .green,
                              shadow: true)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = bank?.name
        
        button.addTarget(self, action: #selector(menuClicked), for: .touchUpInside)
        
        self.navigationController?.view.addSubview(phoneButton)
        self.navigationController?.view.addSubview(locationButton)
        self.navigationController?.view.addSubview(linkButton)
        self.navigationController?.view.addSubview(button)
                
        phoneButton.isHidden = true
        locationButton.isHidden = true
        linkButton.isHidden = true
        
//        if let nav = self.navigationController {
//            button.trailingAnchor.constraint(equalTo: nav.view.trailingAnchor, constant: -19).isActive = true
//            button.bottomAnchor.constraint(equalTo: nav.view.bottomAnchor, constant: -19).isActive = true
//
//            phoneButton.trailingAnchor.constraint(equalTo: nav.view.trailingAnchor, constant: -19).isActive = true
//            phoneButton.bottomAnchor.constraint(equalTo: nav.view.bottomAnchor, constant: -19).isActive = true
//
//            locationButton.trailingAnchor.constraint(equalTo: nav.view.trailingAnchor, constant: -19).isActive = true
//            locationButton.bottomAnchor.constraint(equalTo: nav.view.bottomAnchor, constant: -19).isActive = true
//
//            linkButton.trailingAnchor.constraint(equalTo: nav.view.trailingAnchor, constant: -19).isActive = true
//            linkButton.bottomAnchor.constraint(equalTo: nav.view.bottomAnchor, constant: -19).isActive = true
//        }
        
        
    }

    
    @objc func menuClicked() {
        tableView.alpha = 0.5
        showMenu()
    }
    
    private func showMenu() {
        if phoneButton.isHidden == true {
            UIView.animate(withDuration: 0.3) {
                self.phoneButton.isHidden = false
                self.locationButton.isHidden = false
                self.linkButton.isHidden = false
                
                self.phoneButton.transform = CGAffineTransform(translationX: .zero, y: -(self.phoneButton.frame.width + 12))
                self.locationButton.transform = CGAffineTransform(translationX: .zero, y: -((self.phoneButton.frame.width + 12) * 2))
                self.linkButton.transform = CGAffineTransform(translationX: .zero, y: -((self.phoneButton.frame.width + 12) * 3))
                
                self.button.setImage(UIImage(named: "close"), for: .normal)
                self.button.setImageTintColor(UIColor(hexFromString: "FFFFFF"))
            }
        } else {
            UIView.animate(withDuration: 0.3) {
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let bank = bank else { return UITableViewCell() }
        cell.textLabel?.text = String(bank.rates.usd.buy)
        
        return cell
    }
}

