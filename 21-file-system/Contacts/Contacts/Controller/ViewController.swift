//
//  ViewController.swift
//  Contacts
//
//  Created by Petro Golishevskiy on 01.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var selectContact: Contact?
    private var urls: [URL] = []
    private var contacts: [Contact] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private let identifier = "cell"
    private let documentsURL = FileManager.default.urls(for: .documentDirectory,
                                                        in: .userDomainMask)[0].appendingPathComponent("Contacts")
    
    var resultSearch: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    let searchController = UISearchController(searchResultsController: nil)
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUrls()
        loadData()
        createDirectory()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let oldCountItem = urls.count
        setUrls()
        if oldCountItem != urls.count {
            contacts.removeAll()
            loadData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
    }
    
    func loadData() {
        for url in urls {
            getContact(url: url)
        }
    }
    
    func setUrls() {
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsURL,
                                                                       includingPropertiesForKeys: nil)
            self.urls = fileURLs
        } catch {
            print("error")
        }
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Contacts"
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search contact"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func getContact(url: URL) {
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            var item = try decoder.decode(Contact.self, from: data)
            item.url = url
            contacts.append(item)
            
        } catch {
            print(error)
        }
    }
    
    func filter(searchText: String) {
        //        resultSearch = contacts.filter { $0.firstName.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }
    
    func createDirectory() {
        let fileManager = FileManager.default
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let dataPath = documentsDirectory.appendingPathComponent("Contacts")
        //        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Contactss"))
        
        do {
            try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Error creating directory: \(error.localizedDescription)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addContactSegue" {
            let addContact = segue.destination as! AddContactTableViewController
        } else {
            let addContact = segue.destination as! AddContactTableViewController
            addContact.showContact = self.selectContact
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? resultSearch.count : contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].firstName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectContact = contacts[indexPath.row]
        self.performSegue(withIdentifier: "showContact", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            guard let url = contacts[indexPath.row].url else { return }
            do {
                try FileManager.default.removeItem(at: url)
            } catch {
                print(error)
            }
        }
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filter(searchText: text)
    }
}

