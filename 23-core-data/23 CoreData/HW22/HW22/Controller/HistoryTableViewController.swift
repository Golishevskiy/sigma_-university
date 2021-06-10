//
//  HistoryTableViewController.swift
//  HW22
//
//  Created by Petro Golishevskiy on 08.06.2021.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    @IBOutlet weak var searchNameLabel: UILabel!
    
    private let db = DBLayer.shared
    private var requestHistory = [RepoArray]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.requestHistory = self.db.fetchRepos()
            self.tableView.reloadData()
        }
    }
    
    // tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestHistory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        
        cell.searchTextLabel.text = requestHistory[indexPath.row].searchText
        cell.countLabel.text = requestHistory[indexPath.row].repo?.count.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let select = requestHistory[indexPath.row].repo
        let viewController = RepoHistoryTableViewController()
        viewController.repos = select
        navigationController?.pushViewController(viewController, animated: true)
    }
}
