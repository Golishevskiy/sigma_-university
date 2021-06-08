//
//  RepoTableViewController.swift
//  HW22
//
//  Created by Petro Golishevskiy on 02.06.2021.
//

import UIKit

class RepoTableViewController: UITableViewController, UISearchBarDelegate {
    
    private var currentPage : Int = 1
    private var isLoadingList : Bool = false
    private let network = Network.shared
    private let identifier = "cell"
    private var search = ""
    private let spinner = UIActivityIndicatorView(style: .medium)
    private var items: [Item] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        setupSearchBar()
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "cell")
    }
    // searchBar
    func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        network.search(searchText: search) { [weak self] (items) in
            self?.items = items
        }
    }
    
    // tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                 for: indexPath) as! RepoTableViewCell
        
        let item = items[indexPath.row]
        cell.setup(name: item.fullName,
                   description: item.itemDescription ?? "",
                   rating: item.stars ?? 0,
                   imgURL: item.owner.avatarURL)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSection = tableView.numberOfSections - 1
        let lastRow = tableView.numberOfRows(inSection: lastSection) - 2
        if indexPath.section ==  lastSection && indexPath.row == lastRow {
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(50))
            
            if !isLoadingList && items.count > 10 {
                spinner.startAnimating()
                self.tableView.tableFooterView = spinner
                self.tableView.tableFooterView?.isHidden = false
                loadMore()
            }
        }
    }
    
    func loadMore() {
        self.isLoadingList = true
        currentPage += 1
        network.search(page: currentPage.description,
                       searchText: search) { (items) in
            DispatchQueue.main.async {
                self.items.append(contentsOf: items)
                self.isLoadingList = false
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
            }
        }
    }
}

