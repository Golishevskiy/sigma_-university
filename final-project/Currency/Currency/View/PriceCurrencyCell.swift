//
//  PriceCurrencyCell.swift
//  Currency
//
//  Created by Petro Golishevskiy on 20.06.2021.
//

import UIKit

enum CurrencyNameUA: String {
    case USD = "Долар США"
    case EUR = "Євро"
    case RUR = "Рубль"
    case GBP = "Фунт стерлінг"
    case CHF = "Швейцарський франк"
    case PLN = "Злотий"
}

class PriceCurrencyCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var selLabel: UILabel!
    @IBOutlet weak var buyImage: UIImageView!
    @IBOutlet weak var selImage: UIImageView!
    private let green = UIColor.init(hexFromString: "43BF10")
    private let red = UIColor.init(hexFromString: "F4142F")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func fillIn(bank: Prices) {
        titleLabel.text = bank.currency
        buyLabel.text = bank.buy
        selLabel.text = bank.sel
        
        switch bank.currency {
        case "USD":
            descriptionLabel.text = CurrencyNameUA.USD.rawValue
        case "EUR":
            descriptionLabel.text = CurrencyNameUA.EUR.rawValue
        case "RUR":
            descriptionLabel.text = CurrencyNameUA.RUR.rawValue
        case "GBP":
            descriptionLabel.text = CurrencyNameUA.GBP.rawValue
        case "CHF":
            descriptionLabel.text = CurrencyNameUA.CHF.rawValue
        case "PLN":
            descriptionLabel.text = CurrencyNameUA.PLN.rawValue
        default:
            descriptionLabel.text = ""
        }
    }
    
    func fillIn(price: Prices, oldPrice: Prices?) {
        if let oldPrice = oldPrice {
            fillIn(bank: price)
            
            if let old = Double(oldPrice.buy), let current = Double(price.buy) {
                // set buyLabel color
                if old < current {
                    buyLabel.textColor = green
                    buyImage.image = UIImage(named: "arrow-up")
                    buyImage.image = buyImage.image?.withRenderingMode(.alwaysTemplate)
                    buyImage.tintColor = green
                } else if old > current {
                    buyLabel.textColor = red
                    buyImage.image = UIImage(named: "arrow-down")
                    buyImage.image = buyImage.image?.withRenderingMode(.alwaysTemplate)
                    buyImage.tintColor = red
                } else {
                    buyLabel.textColor = .black
                }
                
                // set selLabel color
                if old < current {
                    selLabel.textColor = green
                    selImage.image = UIImage(named: "arrow-up")
                    selImage.image = selImage.image?.withRenderingMode(.alwaysTemplate)
                    selImage.tintColor = green
                } else if old > current {
                    selLabel.textColor = red
                    selImage.image = UIImage(named: "arrow-down")
                    selImage.image = selImage.image?.withRenderingMode(.alwaysTemplate)
                    selImage.tintColor = red
                } else {
                    selLabel.textColor = .black
                }
            }
        }
    }
}


