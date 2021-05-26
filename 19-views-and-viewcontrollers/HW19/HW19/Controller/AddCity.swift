//
//  AddCityViewController.swift
//  HW19
//
//  Created by Petro Golishevskiy on 25.05.2021.
//

import UIKit

class AddCity: UIViewController {
    
    private var identifier = "cell"
    private var array = [City]()
    var closure: ((City) -> Void)?
    
    @IBOutlet weak var CitiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...25 {
            array.append(City(name: "Ванкувер", timeZone: "Сьогодні, -10год", time: "3:00", country: "Канада"))
        }
    }
}

extension AddCity: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = array[indexPath.row].name + ", " + array[indexPath.row].country
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        closure?(array[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
}
