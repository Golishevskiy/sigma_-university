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
    
    private let router = Router.shared
    var bank: Bank?
    var localBank: Bank?
    var hamburgerMenu = HamburgerMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = bank?.name
        setupAlert()
        fillInHeader()
        hamburgerMenu.addHamburgerMenu(bank: bank,
                                       view: self.view,
                                       navigationController: navigationController!)
    }
    
    private func setupAlert() {
        alert = UINib(nibName: "AlertView", bundle: .main).instantiate(withOwner: nil,
                                                                       options: nil).first as? AlertView
        view.addSubview(alert)
        alert.isHidden = true
        alert.translatesAutoresizingMaskIntoConstraints = false
        setupAlertConstraint()
    }
    
    private func setupAlertConstraint() {
        alert.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        alert.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
        alert.heightAnchor.constraint(equalToConstant: 406).isActive = true
        alert.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func fillInHeader() {
        if bank == nil {
            setupHeader(bank: localBank)
        } else {
            setupHeader(bank: bank)
        }
    }
    
    private func setupHeader(bank: Bank?) {
        guard let item = bank else { return }
        nameLabel.text = item.name
        internetBankingLabel.text = "App"
        logoImageView.loadImageUsingUrlString(urlString: item.imageUrl)
        webSiteLabel.text = item.webSite
        addressLabel.text = "\(item.city), \(item.street)"
        phoneLabel.text = item.supportPhone
        supportPhoneLabel.text = item.phone
        worldSupportPhonelabel.text = item.worldSupportPhone
        emailLabel.text = item.mail
        updateTime.text = Date(timeIntervalSince1970: Double(item.updateTime)).getFormattedDate(format: "HH:mm dd-MM-yyyy")
    }
    
    @IBAction func sharedButton(_ sender: UIBarButtonItem) {
        if alert.isHidden {
            alert.isHidden = false
            view.backgroundColor = .black
            view.subviews[0].alpha = 0.6
            hamburgerMenu.hidden(b: true)
        } else {
            alert.isHidden = true
            view.backgroundColor = .clear
            view.subviews[0].alpha = 1
            hamburgerMenu.hidden(b: false)
        }
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
        if let bank = bank {
            return bank.prices.count
        } else if let localBank = localBank {
            return localBank.prices.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PriceCurrencyCell
        
        if bank != nil && localBank != nil {
            cell.fillIn(price: bank!.prices[indexPath.row], oldPrice: localBank!.prices[indexPath.row])
            return cell
        }
        else if bank == nil && localBank != nil {
            cell.fillIn(bank: localBank!.prices[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}



