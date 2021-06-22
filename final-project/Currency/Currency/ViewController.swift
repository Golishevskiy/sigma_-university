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
    let statusView = StatusView()
    
    var banks = [Bank]() {
        didSet {
            tableView.reloadData()
            //            db.save(banks: banks)
        }
    }
    
    //    var exchangers = [Exchanger]() {
    //        didSet {
    //            prepareData()
    //            db.save(banks: banks)
    //        }
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusView.setupView(superView: view)
        tableView.register(UINib(nibName: "BankCell", bundle: nil), forCellReuseIdentifier: "cell")
        fetchData()
        
        //        let res = db.fetchRepos()
        //        db.delete()
    }
    
    func fetchData() {
        statusView.present = true
        if Reachability.isConnectedToNetwork() {
            print("Internet Connection Available!")
            network.getData { [weak self] (banks) in
                self?.banks = banks
                self?.statusView.present = false
                self?.db.delete()
                self?.db.save(banks: banks)
                
            }
        } else {
            print("Internet Connection not Available!")
            let dbBanks = db.fetchRepos()
            self.banks = transform.prepare(dbBanks: dbBanks)
            self.statusView.present = false
        }
    }
    
    //    private func prepareData() {
    //        for bank in exchangers {
    //            banks.append(transform.prepare(bankServer: bank))
    //        }
    //    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return banks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BankCell
        cell.fillIn(bank: banks[indexPath.row])
        cell.actionClosure = { [weak self] (tag) in
            guard let self = self else { return }
            switch tag {
            case 0:
                self.router.toSafary(link: self.banks[indexPath.row].webSite)
            case 1:
                self.router.toMap(address: self.banks[indexPath.row].city + " " + self.banks[indexPath.row].street, navigation: self.navigationController)
            case 2:
                self.router.toCall(number: self.banks[indexPath.row].phone)
            default:
                print("default")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedBank = banks[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: nil)
        print("\(banks[indexPath.row].name)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passing = segue.destination as! DetailViewController
        passing.bank = selectedBank
    }
}
