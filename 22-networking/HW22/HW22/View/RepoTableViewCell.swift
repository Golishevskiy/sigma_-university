//
//  RepoTableViewCell.swift
//  HW22
//
//  Created by Petro Golishevskiy on 03.06.2021.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoImageView: CustomImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func setup(name: String, description: String, rating: Int, imgURL: String) {
        repoNameLabel.text = name
        descriptionLabel.text = description
        ratingLabel.text = rating.description
        repoImageView.loadImageUsingUrlString(urlString: imgURL)
    }
}
