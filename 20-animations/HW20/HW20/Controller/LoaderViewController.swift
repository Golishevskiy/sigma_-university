//
//  LoaderViewController.swift
//  HW20
//
//  Created by Petro Golishevskiy on 30.05.2021.
//

import UIKit

class LoaderViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    var animating: Bool = false {
        didSet {
            animating ? labelAnimation(isAnimating: true) : labelAnimation(isAnimating: false)
        }
    }
    
    let shapeLayer = CAShapeLayer()
    let progressLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupСircleLayer()
        setupLabel()
        slider.value = 0
        slider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
    }
    
    func setupLabel() {
        view.addSubview(progressLabel)
        progressLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        progressLabel.center = view.center
    }
    
    func setupСircleLayer() {
        let trackLayer = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: .zero,
                                      radius: 100,
                                      startAngle: 0,
                                      endAngle: 2 * CGFloat.pi,
                                      clockwise: true)
        trackLayer.path = circlePath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 10
        trackLayer.position = view.center
        trackLayer.lineCap = .round
        view.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        shapeLayer.lineCap = .round
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.position = view.center
        view.layer.addSublayer(shapeLayer)
    }
    
    func labelAnimation(isAnimating: Bool) {
        let pulseAnimation = CASpringAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 0.45
        pulseAnimation.fromValue = 1.0
        pulseAnimation.toValue = 1.2
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .infinity
        pulseAnimation.initialVelocity = 1.0
        pulseAnimation.damping = 1.0
        if isAnimating {
            progressLabel.layer.add(pulseAnimation, forKey: "pulsation")
        } else {
            progressLabel.layer.removeAllAnimations()
        }
    }
    
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .began: animating = true
            case .ended: animating = false
            default:
                break
            }
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        shapeLayer.strokeEnd = CGFloat(sender.value)
        progressLabel.text = "\(Int(sender.value * 100))%"
    }
}
