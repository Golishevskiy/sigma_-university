import UIKit
import PlaygroundSupport

class ViewController: UIViewController {
    
    let button = UIButton(frame: CGRect(x: 30, y: 30, width: 150, height: 50))
    let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.backgroundColor = .blue
        setupButton()
        view.addSubview(view1)
        view1.addSubview(button)
        
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
    }
    
    func setupButton() {
        button.backgroundColor = .yellow
        button.setTitle("press", for: .normal)
        button.setTitleColor(.magenta, for: .normal)
    }
    
    @objc func changeColor() {
        view1.backgroundColor = .random
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let point = touch.location(in: self.view)
        
        print(point.x)
        print(point.y)
        
        let translate = CGAffineTransform(translationX: point.x, y: point.y)
        view1.layer.setAffineTransform(translate)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("------bounds------")
        print(view1.bounds)
        print(button.bounds)
        
        print("------frame------")
        print(view1.frame)
        print(button.frame)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red:   .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue:  .random(in: 0...1),
                       alpha: 1.0)
    }
}

let viewController = ViewController()
PlaygroundPage.current.liveView = viewController
PlaygroundPage.current.needsIndefiniteExecution = true
