//
//  ViewController.swift
//  Currency
//
//  Created by Petro Golishevskiy on 13.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let router = Router.shared
    let network = Network.shared
    let db = DBLayer.shared
    let transform = PrepareData.shared
    private var selectedBank: Bank?
    private var select = 0
    let statusView = StatusView()
    
    var banks = [Bank]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var localBanks = [Bank]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentOnboarding()
        statusView.setupView(superView: view)
        tableView.register(UINib(nibName: "BankCell", bundle: nil), forCellReuseIdentifier: "cell")
        fetchData()
    }
    
    private func fetchData() {
        statusView.present = true
        if Reachability.isConnectedToNetwork() {
            print("Internet Connection Available!")
            network.getData { [weak self] (banks) in
                guard let self = self else { return }
                self.banks = banks.sorted { $0.name.lowercased() < $1.name.lowercased() }
                self.statusView.present = false
                let dbBanks = self.db.fetchRepos()
                self.localBanks = self.transform.prepare(dbBanks: dbBanks).sorted(by: { $0.name.lowercased() < $1.name.lowercased() })
                self.db.delete()
                self.db.save(banks: banks)
                
            }
        } else {
            print("Internet Connection not Available!")
            let dbBanks = db.fetchRepos()
            self.localBanks = transform.prepare(dbBanks: dbBanks).sorted(by: { $0.name.lowercased() < $1.name.lowercased() })
            self.statusView.present = false
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if banks.isEmpty {
            return localBanks.count
        } else {
            return banks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BankCell
        
        if banks.isEmpty {
            cell.fillIn(bank: localBanks[indexPath.row])
            cell.actionClosure = { (tag) in
                if tag == 2 {
                    self.router.toCall(number: self.localBanks[indexPath.row].phone)
                }
            }
        } else {
            cell.fillIn(bank: banks[indexPath.row])
            cell.actionClosure = { [weak self] (tag) in
                guard let self = self else { return }
                switch tag {
                case 0:
                    self.router.toSafari(link: self.banks[indexPath.row].webSite)
                case 1:
                    self.router.toMap(address: self.banks[indexPath.row].city + " " + self.banks[indexPath.row].street, navigation: self.navigationController)
                case 2:
                    self.router.toCall(number: self.banks[indexPath.row].phone)
                default:
                    print("default")
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.select = indexPath.row
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detail = segue.destination as! DetailViewController
        if banks.isEmpty {
            detail.localBank = localBanks[select]
        } else {
            detail.bank = banks[select]
            detail.localBank = localBanks[select]
        }
    }
}



