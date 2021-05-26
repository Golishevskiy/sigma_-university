//
//  AddCity+Delegate+DataSource.swift
//  HW19
//
//  Created by Petro Golishevskiy on 26.05.2021.
//

import UIKit

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
