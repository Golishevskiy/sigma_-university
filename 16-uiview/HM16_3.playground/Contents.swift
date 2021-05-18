//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        
        let size = CGSize(width: 400, height: 400)
        let point = CGPoint(x: 0, y: 0)
        let rect = CGRect(origin: point, size: size)
        
        // 2. “Намалювати” квітку
        let flowers = FlowersView(frame: rect)
        flowers.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.addSubview(flowers)
        self.view = view
    }
}

// 1. Створити свій підклас UIView
class FlowersView: UIView {
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        drawFlowers(in: rect, in: context, with: colorSpace)
    }
    
    private func degreesToRadians(_ degrees: CGFloat) -> CGFloat {
        return CGFloat.pi * degrees/180.0
    }
    
    private func drawPetal(in rect: CGRect,
                           inDegrees degrees: Int,
                           inContext context: CGContext) {
        context.saveGState()
        defer { context.restoreGState() }
        
        let flowerPetal = CGMutablePath()
        
        let midX = rect.midX
        let midY = rect.midY
        
        let transform = CGAffineTransform(translationX: -midX,
                                          y: -midY).concatenating(CGAffineTransform(rotationAngle:
                                                                                        degreesToRadians(CGFloat(degrees)))).concatenating(CGAffineTransform(translationX: midX, y: midY))
        
        flowerPetal.addEllipse(in: rect, transform: transform)
        context.addPath(flowerPetal)
        context.setStrokeColor(UIColor.black.cgColor)
        context.strokePath()
        context.setFillColor(UIColor.white.cgColor)
        context.addPath(flowerPetal)
        context.fillPath()
    }
    
    private func drawFlowers(in rect: CGRect, in context: CGContext,
                             with colorSpace: CGColorSpace?) {
        context.saveGState()
        defer { context.restoreGState() }
        
        let flowerSize = CGSize(width: 300, height: 300)
        guard let flowerLayer = CGLayer(context,
                                        size: flowerSize,
                                        auxiliaryInfo: nil) else { return }
        
        guard let flowerContext = flowerLayer.context else { return }
        
        // Draw petals of the flower
        drawPetal(in: CGRect(x: 125, y: 230, width: 9, height: 14),
                  inDegrees: 0,
                  inContext: flowerContext)
        drawPetal(in: CGRect(x: 115, y: 236, width: 10, height: 12),
                  inDegrees: 300,
                  inContext: flowerContext)
        drawPetal(in: CGRect(x: 120, y: 246, width: 9, height: 14),
                  inDegrees: 5,
                  inContext: flowerContext)
        drawPetal(in: CGRect(x: 128, y: 246, width: 9, height: 14),
                  inDegrees: 350,
                  inContext: flowerContext)
        drawPetal(in: CGRect(x: 133, y: 236, width: 11, height: 14),
                  inDegrees: 80,
                  inContext: flowerContext)
        
        let center = CGMutablePath()
        let ellipse = CGRect(x: 126, y: 242, width: 6, height: 6)
        center.addEllipse(in: ellipse, transform: .identity)
        
        let orangeColor = UIColor(red: 255 / 255.0,
                                  green: 174 / 255.0,
                                  blue: 49.0 / 255.0,
                                  alpha: 1.0)
        
        // Draw flower
        flowerContext.addPath(center)
        flowerContext.setStrokeColor(UIColor.black.cgColor)
        flowerContext.strokePath()
        flowerContext.setFillColor(orangeColor.cgColor)
        flowerContext.addPath(center)
        flowerContext.fillPath()
        flowerContext.move(to: CGPoint(x: 135, y: 249))
        context.setStrokeColor(UIColor.black.cgColor)
        flowerContext.addQuadCurve(to: CGPoint(x: 133, y: 270),
                                   control: CGPoint(x: 145, y: 250))
        flowerContext.strokePath()
        
        // Draw clones
        context.draw(flowerLayer, at: CGPoint(x: 0, y: 0))
        context.translateBy(x: 20, y: 10)
        context.draw(flowerLayer, at: CGPoint(x: 0, y: 0))
        context.translateBy(x: -30, y: 5)
        context.draw(flowerLayer, at: CGPoint(x: 0, y: 0))
        context.translateBy(x: -20, y: -10)
        context.draw(flowerLayer, at: CGPoint(x: 0, y: 0))
    }
}


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
