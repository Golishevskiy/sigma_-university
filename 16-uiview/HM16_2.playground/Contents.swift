//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        self.view = view
        
        // 1. Створити градієнт використовуючи CGGradient та Context
        let gradient = Gradient()
        view.addSubview(gradient)
        
        // 2. Створити градієнт використовуючи CGGradientLayer
        let rect = CGRect(x: 130, y: 20, width: 100, height: 500)
        let gradientView = GradientContext(frame: rect)
        view.addSubview(gradientView)
    }
}

// CGGradientLayer
class Gradient: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.addSubview(someView)
    }
    
    private let someView: UIView = {
        let size = CGSize(width: 100, height: 500)
        let point = CGPoint(x: 10, y: 10)
        var rect = CGRect(origin: point, size: size)
        let view = UIView(frame: rect)
        
        // Gradient
        let layer = CAGradientLayer()
        layer.frame = CGRect(origin: point, size: size)
        layer.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 0, y: 1)
        view.layer.addSublayer(layer)
        return view
    }()
}

// Context & CGGradient

class GradientContext: UIView {
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        context.saveGState()
        let gradientColors = [UIColor.white, UIColor.black].compactMap({ $0.cgColor })
        
        if let gradient = CGGradient(colorsSpace: colorSpace,
                                     colors: gradientColors
                                        as CFArray, locations: nil) {
            let startPoint = CGPoint(x: 0, y: 0)
            let endPoint = CGPoint(x: 0, y: rect.height)
            context.drawLinearGradient(gradient,
                                       start: startPoint,
                                       end: endPoint,
                                       options: [])
        }
        context.restoreGState()
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
