//
//  DetailViewController.swift
//  Currency
//
//  Created by Petro Golishevskiy on 18.06.2021.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var bank: Exchanger?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = bank?.name
        
//        let button = SharedButton(width: 100, height: 100)
//        button.frame.size = CGSize(width: 100, height: 100)
//        view.addSubview(button)
        
//        let saerchImage = UIImage(named: "linkCopy")
//        let tintedSearchImage = saerchImage?.withRenderingMode(.alwaysTemplate)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: tintedSearchImage, style: .plain, target: nil, action: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let bank = bank else { return UITableViewCell() }
        cell.textLabel?.text = String(bank.rates.usd.buy)
        return cell
    }
}

