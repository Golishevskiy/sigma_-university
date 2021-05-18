//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        self.view = view
        
        // 2. Реалізувати так, щоб при додаванні цього класу до інтерфейсу було
        // видно наступне
        let target = Target()
        view.addSubview(target)
    }
}

// 1. Створити свій підклас UIView
class Target: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.addSubview(redView)
        redView.addSubview(blueView)
        redView.addSubview(pointView)
        
        layout()
    }
    
    private func layout() {
        // pointView
        pointView.center = CGPoint(x: redView.bounds.midX, y: redView.bounds.midY)
        
        // blueView
        blueView.center = CGPoint(x: redView.bounds.midX, y: redView.bounds.midY)
    }
    
    
    private let redView: UIView = {
        let size = CGSize(width: 350, height: 350)
        let point = CGPoint(x: 10, y: 150)
        var rect = CGRect(origin: point, size: size)
        let view = UIView(frame: rect)
        // border
        view.layer.borderWidth = 30
        view.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        view.layer.cornerRadius = view.frame.height / 2
        return view
    }()
    
    private let blueView: UIView = {
        let size = CGSize(width: 230, height: 230)
        var rect = CGRect(origin: .zero, size: size)
        let view = UIView(frame: rect)
        // border
        view.layer.borderWidth = 30
        view.layer.borderColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
        view.layer.cornerRadius = view.frame.width / 2
        return view
    }()
    
    private let pointView: UIView = {
        let size = CGSize(width: 110, height: 110)
        var rect = CGRect(origin: .zero, size: size)
        let view = UIView(frame: rect)
        // border
        view.layer.borderWidth = 60
        view.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        view.layer.cornerRadius = view.frame.width / 2
        return view
    }()
}


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
