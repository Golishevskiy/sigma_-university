//
//  TimeCellTableViewCell.swift
//  HW19
//
//  Created by Petro Golishevskiy on 24.05.2021.
//

import UIKit

class TimeCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func setup(city: String, timeZone: String, time: String) {
        cityNameLabel.text = city
        timeZoneLabel.text = timeZone
        timeLabel.text = time
    }
}
