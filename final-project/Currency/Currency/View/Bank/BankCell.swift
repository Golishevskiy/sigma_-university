//
//  BankCell.swift
//  Currency
//
//  Created by Petro Golishevskiy on 17.06.2021.
//

import UIKit

class BankCell: UITableViewCell {
    
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var bankNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var logoImageView: CustomImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    
    var actionClosure: ((_ buttonTag: Int) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        rootView.addShadow(offset: CGSize.init(width: 0, height: 4),
                           color: .black,
                           radius: 4,
                           opacity: 0.25)
        setupImage()
    }
    
    func fillIn(bank: Bank) {
        logoImageView.loadImageUsingUrlString(urlString: bank.imageUrl)
        bankNameLabel.text = bank.name
        phoneLabel.text = bank.phone
        cityLabel.text = bank.city
        streetLabel.text = bank.street
    }
    
    func setupImage() {
        let linkImage = UIImage(named: "link")
        let tintedLinkImage = linkImage?.withRenderingMode(.alwaysTemplate)
        linkButton.setImage(tintedLinkImage, for: .normal)
        linkButton.tintColor = UIColor(named: "currencyBlue")
        
        let locationImage = UIImage(named: "location")
        let tintedLocationImage = locationImage?.withRenderingMode(.alwaysTemplate)
        locationButton.setImage(tintedLocationImage, for: .normal)
        locationButton.tintColor = UIColor(named: "currencyBlue")
        
        let phoneImage = UIImage(named: "phone")
        let tintedPhoneImage = phoneImage?.withRenderingMode(.alwaysTemplate)
        phoneButton.setImage(tintedPhoneImage, for: .normal)
        phoneButton.tintColor = UIColor(named: "currencyBlue")       
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        actionClosure?(sender.tag)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

