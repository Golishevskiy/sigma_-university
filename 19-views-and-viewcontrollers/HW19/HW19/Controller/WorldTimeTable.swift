//
//  WorldTimeTableViewController.swift
//  HW19
//
//  Created by Petro Golishevskiy on 24.05.2021.
//

import UIKit

class WorldTimeTable: UITableViewController {
    
    private var identifier = "cell"
    private var array = [City]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDemonstrationData()
    }
    
    func setDemonstrationData() {
        array.append(City(name: "Київ",
                          timeZone: "Сьогодні, +0год",
                          time: "21:54",
                          country: "Україна"))
        array.append(City(name: "Копенгаґен",
                          timeZone: "Сьогодні, -1год",
                          time: "20:54",
                          country: "Данія"))
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                 for: indexPath) as! TimeCellTableViewCell
        let city = array[indexPath.row]
        cell.setup(city: city.name, timeZone: city.timeZone, time: city.time)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            array.remove(at: indexPath.row)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddCity else { return }
        destination.closure = { [weak self] city in
            self?.array.append(city)
        }
    }
}
