//
//  ViewController.swift
//  Currency
//
//  Created by Petro Golishevskiy on 13.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var selectedBank: Exchanger?
    let network = Network.shared
    let transform = PrepareData.shared
    let statusView = StatusView()
    var exchangers = [Exchanger]() {
        didSet {
            tableView.reloadData()
            testBank = transform.prepare(bankServer: exchangers[0])
        }
    }
    
    var testBank: Bank!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusView.setupView(superView: view)
        tableView.register(UINib(nibName: "BankCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        statusView.present = true
        network.getData { (exchangers) in
            self.exchangers = exchangers
            self.statusView.present = false
        }
    }
    
    private func prepareData() {
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exchangers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BankCell
        cell.fillIn(bank: exchangers[indexPath.row])
        cell.actionClosure = { (tag) in
            switch tag {
            case 0:
                if let url = URL(string: self.exchangers[indexPath.row].website) {
                    UIApplication.shared.open(url)
                }
            case 1:
                let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
                viewController.searchName = self.testBank.city + " " + self.testBank.street
                self.navigationController?.pushViewController(viewController, animated: true)
            case 2:
                if let url = URL(string: "tel://0443332211") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            default:
                print("default")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedBank = exchangers[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: nil)
        print("\(exchangers[indexPath.row].name)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passing = segue.destination as! DetailViewController
        passing.bank = selectedBank
    }
}












