//
//  PriceCurrencyCell.swift
//  Currency
//
//  Created by Petro Golishevskiy on 20.06.2021.
//

import UIKit

class PriceCurrencyCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var selLabel: UILabel!
    @IBOutlet weak var buyImage: UIImageView!
    @IBOutlet weak var selImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillIn(title: String, description: String, buyLabel: String, selLabel: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        self.buyLabel.text = buyLabel
        self.selLabel.text = selLabel
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
