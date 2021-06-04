//
//  RepoTableViewCell.swift
//  HW22
//
//  Created by Petro Golishevskiy on 03.06.2021.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var repoImageView: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func setup(name: String, description: String, rating: Int, imgURL: String) {
        repoNameLabel.text = name
        descriptionLabel.text = description
        ratingLabel.text = rating.description
        guard let url = URL(string: imgURL) else { return }
        repoImageView.load(url: url)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
