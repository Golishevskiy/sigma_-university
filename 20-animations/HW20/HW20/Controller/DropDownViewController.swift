//
//  DropDownViewController.swift
//  HW20
//
//  Created by Petro Golishevskiy on 31.05.2021.
//

import UIKit

class DropDownViewController: UIViewController {
    
    @IBOutlet weak var productListButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stackView: UIStackView!
    
    private var downIcon = UIImage()
    private var upIcon = UIImage()
    private let timeAnimations = 0.4
    private var items = ["apples",
                         "bananas",
                         "avocado",
                         "butter",
                         "bread"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        setImages()
        borderStackView()
    }
    
    private func setImages() {
        guard let iconDown = UIImage(systemName: "chevron.down") else { return }
        guard let iconUp = UIImage(systemName: "chevron.up") else { return }
        downIcon = iconDown
        upIcon = iconUp
        
        productListButton.addRightImage(image: downIcon, offset: 16)
        productListButton.tintColor = .systemGray
    }
    
    func borderStackView() {
        stackView.layer.borderWidth = 2
        stackView.layer.borderColor = UIColor.systemGray.cgColor

    }
    
    @IBAction func productListButton(_ sender: UIButton) {
        if tableView.isHidden {
            productListButton.setImage(upIcon, for: .normal)
            UIView.animate(withDuration: timeAnimations) { [weak self] in
                self?.tableView.isHidden = false
            }
        } else {
            productListButton.setImage(downIcon, for: .normal)
            UIView.animate(withDuration: timeAnimations) { [weak self] in
                self?.tableView.isHidden = true
            }
        }
    }
}

extension DropDownViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}



