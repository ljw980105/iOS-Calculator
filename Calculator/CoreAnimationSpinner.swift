//
//  CoreAnimationSpinner.swift
//  Calculator
//
//  Created by Jing Wei Li on 8/2/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//

import Foundation
import UIKit

class CoreAnimationSpinner: UIView {
    private let shapeLayer = CAShapeLayer()
    private var startedSpinning = false
    private var view: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(on view: UIView, withColor color: UIColor){
        super.init(frame: view.frame)
        self.view = view
        let commonFrame = CGRect(x: 0, y: 0, width: 120, height: 120)
        shapeLayer.frame = commonFrame
        shapeLayer.path = UIBezierPath(ovalIn: commonFrame).cgPath
        shapeLayer.lineWidth = 3.0
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = color.cgColor
    }
    
    // MARK: Public Methods
    
    func startSpinning() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.shapeLayer.position = strongSelf.view?.center ?? CGPoint()
            strongSelf.shapeLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            strongSelf.startedSpinning = true
            strongSelf.view?.layer.addSublayer(strongSelf.shapeLayer)
            strongSelf.rotate(duration: 1.5)
        }
    }
    
    func endSpinning() {
        guard startedSpinning else { return }
        stopRotating()
        startedSpinning = false
        for layer in self.view?.layer.sublayers ?? [] {
            if let shape = layer as? CAShapeLayer {
                shape.removeFromSuperlayer()
                break
            }
        }
    }
    
    // MARK: Private Methods
    
    private func rotate(duration: TimeInterval) {
        
        let startAnimation = CABasicAnimation(keyPath: "strokeEnd")
        startAnimation.fromValue = 0.0
        startAnimation.toValue = 1.0
        startAnimation.duration = duration
        startAnimation.beginTime = 0
        
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 1.0
        let reverseAnimation = CABasicAnimation(keyPath: "strokeStart")
        reverseAnimation.toValue = 1.0
        reverseAnimation.duration = duration
        reverseAnimation.beginTime = duration
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [reverseAnimation, startAnimation]
        animationGroup.repeatCount = .greatestFiniteMagnitude
        animationGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animationGroup.autoreverses = true
        animationGroup.duration = duration * 2
        
        shapeLayer.add(animationGroup, forKey: "spinningAnimation")
        
    }
    
    private func stopRotating() {
        if layer.animation(forKey: "spinningAnimation") != nil {
            layer.removeAnimation(forKey: "spinningAnimation")
        }
    }
}
