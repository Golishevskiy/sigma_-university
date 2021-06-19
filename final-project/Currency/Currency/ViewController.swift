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
    let statusView = StatusView()
    var exchangers = [Exchanger]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusView.setupView(superView: view)
        tableView.register(UINib(nibName: "BankCell", bundle: nil), forCellReuseIdentifier: "cell")
    
        
        
        
//        let saerchImage = UIImage(named: "searchBarButton")
//        let tintedSearchImage = saerchImage?.withRenderingMode(.alwaysTemplate)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: tintedSearchImage, style: .plain, target: nil, action: nil)
//        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "white")
        
        statusView.present = true
        network.getData { (exchangers) in
            self.exchangers = exchangers
            self.statusView.present = false
        }
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
                print("link \(self.exchangers[indexPath.row].website)")
            case 1:
                let map = MapViewController()
                self.navigationController?.pushViewController(map, animated: true)
                print("location")
            case 2:
                //                if let url = URL(string: "tel://0443332211") {
                //                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                //                }
                print("phone")
            default:
                print("default")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detail = DetailViewController()
//        navigationController?.pushViewController(detail, animated: true)
        self.selectedBank = exchangers[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: nil)
        print("\(exchangers[indexPath.row].name)")
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passing = segue.destination as! DetailViewController
        passing.bank = selectedBank
    }
}












