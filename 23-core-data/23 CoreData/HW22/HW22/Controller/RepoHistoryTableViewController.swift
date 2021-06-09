//
//  RepoHistoryTableViewController.swift
//  HW22
//
//  Created by Petro Golishevskiy on 08.06.2021.
//

import UIKit

class RepoHistoryTableViewController: UITableViewController {
    
    var repos: [Repo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "cell")
    }
    
    // tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let repos = repos else { return 0 }
        return repos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepoTableViewCell
        guard let repos = repos else { return UITableViewCell() }
        let item = repos[indexPath.row]
        cell.setup(name: item.name ?? "",
                   description: item.itemDescription ?? "",
                   rating: Int(item.stars),
                   imgURL: "")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let arrayRepo = repos else { return }
        guard let select = arrayRepo[indexPath.row].htmlURL else { return }
        let webViewController = WEBViewController()
        webViewController.urlString = select
        navigationController?.pushViewController(webViewController, animated: true)
    }
}
