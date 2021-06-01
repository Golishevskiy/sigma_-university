//
//  ViewController.swift
//  HW20
//
//  Created by Petro Golishevskiy on 28.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var imageNames = ["cat", "cat1", "cat2", "cat3", "cat4"]
    private var array = [CALayer]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        cleanButton.isHidden = true
        setupArray()
        view.addSubview(cleanButton)
        NSLayoutConstraint.activate([
            cleanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                constant: -30),
            cleanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    lazy var cleanButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("clean", for: .normal)
        button.addTarget(self, action: #selector(clean), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func clean() {
        view.layer.sublayers = nil
        view.addSubview(cleanButton)
        array.removeAll()
        cleanButton.isHidden = true
        setupArray()
    }
    
    private func setupArray() {
        for name in imageNames {
            let myLayer: CALayer = {
                let layer = CALayer()
                let myImage = UIImage(named: name)?.cgImage
                layer.contents = myImage
                layer.contentsGravity = .resizeAspectFill
                layer.cornerRadius = 20
                layer.backgroundColor = UIColor.orange.cgColor
                layer.masksToBounds = true
                return layer
            }()
            array.append(myLayer)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            cleanButton.isHidden = false
            let position = touch.location(in: view)
            let newPosition = CGPoint(x: position.x - 75, y: position.y - 110)
            guard let layer = array.first else { return }
            layer.frame = CGRect(origin: newPosition, size: CGSize(width: 180,
                                                                   height: 180))
            view.layer.addSublayer(layer)
            layer.rotateXY()
            let removed =  array.removeFirst()
            
            if removed.contains(position) {
                print("touched")
            }
            
            if let sublayers = view.layer.sublayers {
                for layer in sublayers {
                    if (layer.hitTest(position) != nil) {
                        print(layer.description)
                    }
                }
            }
        }
    }
}


extension CALayer {
    func rotateXY() {
        let rotateAnimationX = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        rotateAnimationX.valueFunction = CAValueFunction(name: .rotateX)
        rotateAnimationX.fromValue = 0
        rotateAnimationX.toValue = 6
        rotateAnimationX.isAdditive = true
        rotateAnimationX.isCumulative = true
        
        let rotateAnimationZ = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        rotateAnimationZ.valueFunction = CAValueFunction(name: .rotateZ)
        rotateAnimationZ.fromValue = 3
        rotateAnimationZ.toValue = 9
        rotateAnimationZ.duration = 0.6
        rotateAnimationZ.isAdditive = true
        
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.fromValue = 0.0
        opacityAnimation.toValue = 1.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [rotateAnimationX, rotateAnimationZ, opacityAnimation]
        animationGroup.duration = 2.0
        
        self.add(animationGroup, forKey: nil)
    }
}



