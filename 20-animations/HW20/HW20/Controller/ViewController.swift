//
//  ViewController.swift
//  HW20
//
//  Created by Petro Golishevskiy on 28.05.2021.
//

import UIKit

class ViewController: UIViewController {
    var imageNames = ["cat", "cat1", "cat2", "cat3", "cat4", "cat5"]
    var array = [CALayer]()

    override func viewDidLoad() {
        super.viewDidLoad()
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
        button.backgroundColor = .blue
        button.setTitle("clean", for: .normal)
        button.addTarget(self, action: #selector(clean), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func clean() {
        view.layer.sublayers = nil
        view.addSubview(cleanButton)
        setupArray()
        
    }
    
    
    
    private func setupArray() {
        let imageNames = ["cat", "cat1", "cat2", "cat3", "cat4"]
        
        for name in imageNames {
            let myLayer: CALayer = {
                let layer = CALayer()
                let myImage = UIImage(named: name)?.cgImage
                layer.contents = myImage
                layer.contentsGravity = .resizeAspect
                layer.cornerRadius = 20
                layer.masksToBounds = true
                return layer
            }()
            array.append(myLayer)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            
            let touch = touches.first
                    let point = touch!.location(in: self.view)
                    if array[0].contains(point) {
                        print ("We tapped the square")
                    }
            
            let position = touch!.location(in: view)
            let newPosition = CGPoint(x: position.x - 75, y: position.y - 110)
            
//            let myLayer = CALayer()
//            let myImage = UIImage(named: "cat")?.cgImage
//            let animation1 = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
////
//            animation1.fromValue = 0.0
//            animation1.toValue = 1.0
//            animation1.duration = 0.7
//            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            let animation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
            animation.fromValue = CGSize(width: 0, height: 0)
            animation.toValue = CGSize(width: position.x, height: position.y)
            
            _ = CABasicAnimation(keyPath: #keyPath(CALayer.bounds))
            
            let rotateAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
            rotateAnimation.valueFunction = CAValueFunction(name: .rotateX)
            rotateAnimation.fromValue = 0
            rotateAnimation.toValue = 6
            
            
//            rotateAnimation.duration = 1.0
            
            let rotateAnimation1 = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
            rotateAnimation1.valueFunction = CAValueFunction(name: .rotateZ)
            rotateAnimation1.fromValue = 3
            rotateAnimation1.toValue = 9
            rotateAnimation1.duration = 0.6
            
            let animGroup = CAAnimationGroup()
            animGroup.animations = [rotateAnimation, rotateAnimation1]
            animGroup.duration = 1.0
            
//            myLayer.add(animGroup, forKey: nil)
//            myLayer.frame = CGRect(origin: newPosition, size: CGSize(width: 150, height: 220))
//            myLayer.contents = myImage
//            myLayer.contentsGravity = .resizeAspect
            guard let layer = array.first else { return }
            layer.frame = CGRect(origin: newPosition, size: CGSize(width: 150, height: 220))
            view.layer.addSublayer(layer)
            layer.rotateXY()
            array.removeFirst()
            
            
        }
    }
}


extension CALayer {
    func rotateXY() {
        
        let rotateAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        rotateAnimation.valueFunction = CAValueFunction(name: .rotateX)
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = 6
        
        let rotateAnimation1 = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        rotateAnimation1.valueFunction = CAValueFunction(name: .rotateZ)
        rotateAnimation1.fromValue = 3
        rotateAnimation1.toValue = 9
        rotateAnimation1.duration = 0.6
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [rotateAnimation, rotateAnimation1]
        animGroup.duration = 1.0
        
        self.add(animGroup, forKey: nil)
    }
}
    



