//
//  RepoTableViewController.swift
//  HW22
//
//  Created by Petro Golishevskiy on 02.06.2021.
//

import UIKit

class RepoTableViewController: UITableViewController {
    let net = Network()
    private var repositories = [Any]()
    var identifier = "cell"
    private var items: [Item]? {
        didSet {
            items?.sort(by: {$0.stars > $1.stars})
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        net.search(page: "1",
                   searchText: "Alamofire") { [weak self] (items) in
            self?.items = items
        }
        setupSearchBar()
        
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "cell")
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = self.items else {
            return 0
        }
        return items.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                 for: indexPath) as! RepoTableViewCell
        
        guard let items = self.items else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.setup(name: item.fullName,
                   description: item.itemDescription,
                   rating: item.stars,
                   imgURL: item.owner.avatarURL)

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RepoTableViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    print("searchController")
  }
}
