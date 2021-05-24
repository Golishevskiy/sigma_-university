//
//  WorldTimeTableViewController.swift
//  HW19
//
//  Created by Petro Golishevskiy on 24.05.2021.
//

import UIKit

class WorldTimeTableViewController: UITableViewController {
    
    private var array = [("Київ", "Сьогодні, +0год", "21:54"),
                         ("Копенгаґен", "Сьогодні, -1год", "20:54")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as! TimeCellTableViewCell
        cell.setup(city: array[indexPath.row].0, timeZone: array[indexPath.row].1, time: array[indexPath.row].2)
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailSegue", sender: self)
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.array.remove(at: indexPath.row)
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
        }
    }
}
