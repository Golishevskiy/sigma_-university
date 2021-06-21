//
//  DetailViewController.swift
//  Currency
//
//  Created by Petro Golishevskiy on 18.06.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoImageView: CustomImageView!
    @IBOutlet weak var internetBankingLabel: UILabel!
    @IBOutlet weak var webSiteLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var supportPhoneLabel: UILabel!
    @IBOutlet weak var worldSupportPhonelabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var updateTime: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var alert: AlertView!
    
    
    var alertIsHidden = true {
        didSet {
            
        }
    }
    private let router = Router.shared
    var bank: Bank?
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
        alert = UINib(nibName: "AlertView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! AlertView
        view.addSubview(alert)
        alert.isHidden = true
        alert.translatesAutoresizingMaskIntoConstraints = false
        setupAlertConstraint()
    
        //        tableView.register(UINib(nibName: "PriceCurrencyCell", bundle: nil), forCellReuseIdentifier: "cell")
        setupButtons()
        fillInHeader()
    }
    
    private func setupAlertConstraint() {
        alert.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        alert.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
        alert.heightAnchor.constraint(equalToConstant: 406).isActive = true
        alert.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func menuClicked(sender: UIButton) {
        guard let bank = bank else { return }
        switch sender.tag {
        case 0:
            router.toSafary(link: bank.webSite)
        case 1:
            router.toMap(address: bank.city + " " + bank.street,
                         navigation: navigationController)
        case 2:
            router.toCall(number: bank.phone)
        case 3:
            showMenu()
        default:
            print("default")
        }
    }
    
    private func fillInHeader() {
        guard let bank = bank else { return }
        nameLabel.text = bank.name
        logoImageView.loadImageUsingUrlString(urlString: bank.imageUrl)
        webSiteLabel.text = bank.webSite
        addressLabel.text = "\(bank.city) + \(bank.street)"
        phoneLabel.text = bank.supportPhone
        supportPhoneLabel.text = bank.phone
        worldSupportPhonelabel.text = bank.worldSupportPhone
        emailLabel.text = bank.mail
        updateTime.text = Date(timeIntervalSince1970: Double(bank.updateTime)).getFormattedDate(format: "HH:mm dd-MM-yyyy")
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
        alert.isHidden = false
        view.backgroundColor = .black
        view.subviews[0].alpha = 0.6
        button.isHidden = true
        print("sharedButton")
        guard let bank = bank else { return }
        
        alert.fillIn(bank: bank)
        alert.callBack = {
            let activityController = UIActivityViewController(activityItems: [self.bank],
                                                          applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let bank = bank else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PriceCurrencyCell
        cell.fillIn(title: bank.prices[indexPath.row].currency, description: "Долар США", buyLabel: bank.prices[indexPath.row].purchase, selLabel: bank.prices[indexPath.row].sale)
        return cell
    }
}



