//
//  ViewController.swift
//  Contacts
//
//  Created by Petro Golishevskiy on 01.06.2021.
//

import UIKit


protocol ContactDelegate {
    func passData(contact: Contact)
}

class ViewController: UIViewController, ContactDelegate {
    func passData(contact: Contact) {
        print(contact.name)
        print(contact.secondName)
        print(contact.phone)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    lazy var selectContact: String = ""
    var contactDictionary = [String: [String]]()
    var sectionTitle = [String]()
    private var urls: [URL] = []
    
    private var contacts = ["Petro", "Ivan", "Roman", "Taras", "Artur",
                            "Petro", "Ivan", "Roman", "Taras", "Artur",
                            "Petro", "Ivan", "Roman", "Taras", "Artur",
                            "Petro", "Ivan", "Roman", "Taras", "Artur",
                            "Petro", "Ivan", "Roman", "Taras", "Artur",
                            "Petro", "Ivan", "Roman", "Taras", "Artur"]
    
    
    private let identifier = "cell"
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
        
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Contacts")
        //                let stringPath = Bundle.main.path(forResource: documentsURL.absoluteString, ofType: "plist")
        
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
            self.urls = fileURLs
        } catch {
            
        }
        
        
        
        
        
        for url in urls {
            getContact(url: url)
        }
        
        
        createDirectory()
        fillInSection()
        
        
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
            if let data = NSMutableDictionary(contentsOf: url) {
                print(data["secondName"])
            }
        }catch {
            print("error")
        }
    }
    
    func getPlist(pathStr path: String) -> [String: String]? {
        if let xml = FileManager.default.contents(atPath: path) {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String: String]
        }
        
        return nil
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
    
    func readPropertyList() {
        var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml
        var plistData: [String: String] = [:]
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let dataPath = documentsDirectory.appendingPathComponent("Contacts/newFolder")
        
        let plistPath: String? = Bundle.main.path(forResource: "data", ofType: "plist")!
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        do {//convert the data to a dictionary and handle errors.
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [String: String]
            
        } catch {
            print("Error reading plist: \(error), format: \(propertyListFormat)")
        }
    }
    
    func fillInSection() {
        for contact in contacts {
            let key = String(contact.prefix(1))
            if var values = contactDictionary[key] {
                values.append(contact)
                contactDictionary[key] = values
            } else {
                contactDictionary[key] = [contact]
            }
        }
        
        sectionTitle = [String](contactDictionary.keys)
        sectionTitle = sectionTitle.sorted(by: { $0 < $1 })
    }
    
    func filter(searchText: String) {
        resultSearch = contacts.filter { $0.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addContactSegue" {
            let addContact = segue.destination as! AddContactTableViewController
            addContact.delegate = self
        } else {
            let addContact = segue.destination as! AddContactTableViewController
            let cont = Contact(name: self.selectContact,
                               secondName: self.selectContact,
                               phone: "0639574321", image: nil)
            addContact.showContact = cont
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return resultSearch.count
        } else {
            let key = sectionTitle[section]
            if let values = contactDictionary[key] {
                return values.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if searchController.isActive {
            cell.textLabel?.text = resultSearch[indexPath.row]
            return cell
        } else {
            let key = sectionTitle[indexPath.section]
            if let value = contactDictionary[key] {
                cell.textLabel?.text = value[indexPath.row]
                return cell
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = sectionTitle[indexPath.section]
        self.selectContact = (contactDictionary[key]?[indexPath.row])!
        self.performSegue(withIdentifier: "showContact", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let key = sectionTitle[indexPath.section]
            contactDictionary[key]?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return searchController.isActive ? nil : sectionTitle
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchController.isActive ? 0 : sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return searchController.isActive ? nil : sectionTitle[section]
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filter(searchText: text)
    }
}
