//
//  AlarmCell.swift
//  HW19
//
//  Created by Petro Golishevskiy on 26.05.2021.
//

import UIKit

class AlarmCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(time: String, description: String) {
        timeLabel.text = time
        descriptionLabel.text = description
    }
    
    @IBAction func alarmSwitch(_ sender: UISwitch) {
    }
    
}
