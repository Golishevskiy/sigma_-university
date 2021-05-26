//
//  AddCityViewController.swift
//  HW19
//
//  Created by Petro Golishevskiy on 25.05.2021.
//

import UIKit

class AddCity: UIViewController {
    
    let identifier = "cell"
    var array = [City]()
    var closure: ((City) -> Void)?
    
    @IBOutlet weak var CitiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...25 {
            array.append(City(name: "Ванкувер",
                              timeZone: "Сьогодні, -10год",
                              time: "3:00",
                              country: "Канада"))
        }
    }
}


