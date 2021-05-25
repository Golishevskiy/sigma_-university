//
//  ViewController.swift
//  HM18
//
//  Created by Petro Golishevskiy on 22.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var callButton: CustomButton!
    @IBOutlet weak var deleteButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        deleteButton.isHidden = true
    }
    
    func setupView() {
        view.addSubview(topView)
        topView.addSubview(numberLabel)
        topView.addSubview(addButton)
        setupDeleteButton()
        setupCallButton()
        layout()
    }
    
    func layout() {
        // topView
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        topView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
        
        // numberLabel
        numberLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        numberLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // addButton
        addButton.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 10).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @IBAction func numberButtonAction(_ sender: CustomButton) {
        guard let text = sender.topLabel.text else { return }
        guard let number = numberLabel.text else { return }
        if number == "" {
            deleteButton.isHidden = false
        }
        numberLabel.text? = (numberLabel.text! + text).maxLength(length: 12)
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        guard let text = numberLabel.text else { return }
        if !text.isEmpty {
            numberLabel.text?.removeLast()
        }
        guard let number = numberLabel.text else { return }
        if number == "" {
            deleteButton.isHidden = true
        }
    }
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 38)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Number", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(goTo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupCallButton() {
        callButton.setImage(UIImage(named: "call"), for: .normal)
        callButton.imageEdgeInsets = UIEdgeInsets(top: 20,left: 20,bottom: 20,right: 20)
        callButton.tintColor = .white
        callButton.backgroundColor = .systemGreen
    }
    
    func setupDeleteButton() {
        deleteButton.setImage(UIImage(systemName: "delete.left.fill"), for: .normal)
        deleteButton.imageEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        deleteButton.backgroundColor = .white
        deleteButton.tintColor = UIColor.systemGray4
    }
    
    @objc func goTo() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: "AddContactViewController") as! AddContactViewController
        present(destination, animated: true) {
            destination.phoneNumber.text = self.numberLabel.text
        }
    }
}





