//
//  ViewController.swift
//  HM17_1
//
//  Created by Petro Golishevskiy on 17.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layout()
    }
    
    private func setupViews() {
        self.view.addSubview(catImageView)
        self.view.addSubview(someLabel)
        self.view.addSubview(smileButton)
        view.backgroundColor = UIColor(red: 240/255, green: 255/255, blue: 230/255, alpha: 1)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            if UIDevice.current.orientation.isLandscape {
                smileButton.isHidden = true
            } else {
                smileButton.isHidden = false
            }
        }
    
    var catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var someLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blue
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "I'm happy cat"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let smileButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.setTitle("Let cat smile!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(UIColor(red: 45/255, green: 68/255, blue: 115/255, alpha: 1), for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func buttonAction() {
        catImageView.image = UIImage(named: "cat2")
        someLabel.text = "WHAT?"
    }
    
    private func layout() {
        // catImageView
        catImageView.topAnchor.constraint(equalTo: self.view.safeTopAnchor).isActive = true
        catImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true
        catImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8).isActive = true
        catImageView.widthAnchor.constraint(equalToConstant: view.frame.width - 16).isActive = true
        catImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true

        // someLabel
        someLabel.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 20).isActive = true
        someLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        someLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true

        // smileButton
        smileButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -20).isActive = true
        smileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        smileButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
}

