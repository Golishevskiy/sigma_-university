//
//  DetailViewController.swift
//  Currency
//
//  Created by Petro Golishevskiy on 18.06.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var bank: Exchanger?
    
    let phoneButton = MenuButton(diameter: 60,
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
    let button = MenuButton(diameter: 60,
                              imageName: "menu2",
                              tintColor: .white,
                              bgColor: .green,
                              shadow: true)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = bank?.name
        setupButtons()
    }

    @objc func menuClicked(sender: UIButton) {
        
        switch sender.tag {
        case 0:
            if let url = URL(string: self.bank!.website) {
                UIApplication.shared.open(url)
            }
        case 1:
            let map = MapViewController()
            self.navigationController?.pushViewController(map, animated: true)
        case 2:
            if let url = URL(string: "tel://0443332211") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        case 3:
            showMenu()
        default:
            print("default")
        }
    }
    
    private func setupButtons() {
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
    
    private func showMenu() {
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
    
    
    @IBAction func sharedButton(_ sender: UIBarButtonItem) {
        print("sharedButton")
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let bank = bank else { return UITableViewCell() }
        cell.textLabel?.text = String(bank.rates.usd.buy)
        return cell
    }
}

