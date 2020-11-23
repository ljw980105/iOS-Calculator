//
//  PrizeWheelScene.swift
//  Calculator
//
//  Created by Jing Wei Li on 11/22/20.
//  Copyright © 2020 Jing Wei Li. All rights reserved.
//

import UIKit
import SpriteKit

class PrizeWheelScene: SKScene {
    var circle = SKSpriteNode()
    var labels = SKSpriteNode()
    var tip: SKSpriteNode!
    let prizes = PrizeWheelPrize.prizes
    var firstPoint: CGPoint = CGPoint(x: 0.0, y: 0.0)
    let DEGREE_TO_RADIAN: CGFloat = 0.0174532925
    var background: SKSpriteNode!
    var alert: (String, @escaping (UIAlertAction) -> Void) -> Void = { _, _ in }
    var rotationEnded = false
    let radius: CGFloat = 180
    let wheelColors = [UIColor.red, UIColor.orange, UIColor.green]
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        addBackground()
        setupPrizeWheel(radius: radius, center: .zero)
        setupSpinnerTip(radius: radius + 60)
        
        physicsWorld.contactDelegate = self
    }
    
    func setupPrizeWheel(radius: CGFloat, center: CGPoint) {
        let degreesPartition = CGFloat(360.0) / CGFloat(prizes.count)
        var totalDegrees: CGFloat = 0
        for (i, prize) in prizes.enumerated() {
            let path = CGMutablePath()
            path.move(to: center)
            path.addArc(center: center, radius: radius, startAngle: totalDegrees * DEGREE_TO_RADIAN,
                        endAngle: (totalDegrees + degreesPartition) * DEGREE_TO_RADIAN, clockwise: false)
            let node = SKShapeNode(path: path)
            node.position = center
            node.zPosition = 1
            node.lineWidth = 2.0
            let color = wheelColors[i % 3]
            node.strokeColor = color
            node.fillColor = color
            
            node.physicsBody = SKPhysicsBody(edgeLoopFrom: path)
            node.physicsBody?.collisionBitMask = 0
            node.physicsBody?.affectedByGravity = false
            node.physicsBody?.contactTestBitMask = 0b0001
            
            let label = SKLabelNode(text: prize.name)
            let xl = radius * cos((totalDegrees + degreesPartition/2) * DEGREE_TO_RADIAN) / 2
            let yl = radius * sin((totalDegrees + degreesPartition/2) * DEGREE_TO_RADIAN) / 2
            label.fontSize = 40
            label.fontColor = .purple
            label.position = CGPoint(x: xl, y: yl)
            node.addChild(label)
            
            circle.addChild(node)
            totalDegrees += degreesPartition
        }
        circle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        circle.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(circle)
    }
    
    func addBackground() {
        background = SKSpriteNode(imageNamed: "Background")
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = 0
        background.size = CGSize(width: size.width, height: size.height)
        addChild(background)
    }
    
    func setupSpinnerTip(radius: CGFloat) {
        tip = SKSpriteNode(imageNamed: "spinnerTip")
        tip.zPosition = 2
        tip.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        tip.position = CGPoint(x: size.width/2, y: size.height/2 + radius)
        
        if let image = UIImage(named: "spinnerTip") {
            tip.physicsBody = SKPhysicsBody(texture: SKTexture(image: image), size: image.size)
            tip.physicsBody?.collisionBitMask = 0
            tip.physicsBody?.affectedByGravity = false
            tip.physicsBody?.contactTestBitMask = 0b0010
        }
        
        addChild(tip)
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstPoint = touches.first?.location(in: self) ?? .zero
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let lastPoint = touches.first?.location(in: self) ?? .zero
        let absX = abs(lastPoint.x - firstPoint.x)
        let absY = abs(lastPoint.y - firstPoint.y)
        let distance = sqrt(pow(absX, 2) + pow(absY, 2))
        let degreesToSpin = distance * 5 * DEGREE_TO_RADIAN
        let directionFactor: CGFloat = lastPoint.y - firstPoint.y > 0 ? 1 : -1
        let action = SKAction.rotate(byAngle: degreesToSpin * directionFactor, duration: 1)
        action.timingMode = .easeOut
        circle.run(action)
        tip.run(.sequence([
            .wait(forDuration: 1.01),
            .move(to: CGPoint(x: size.width/2, y: size.height/2 + radius + 28), duration: 0.05)
        ]))
    }
    
    func checkWinnings(for contact: SKPhysicsContact) {
        if contact.bodyB == tip.physicsBody {
            for (i, prize) in circle.children.enumerated() {
                if contact.bodyA == prize.physicsBody {
                    alert("You won prize \(self.prizes[i].name)") { [weak self] _ in
                        self?.resetTip()
                    }
                }
            }
        }
    }
    
    func resetTip() {
        tip.physicsBody?.contactTestBitMask = 0
        circle.children.forEach { $0.physicsBody?.contactTestBitMask = 0 }
        tip.run(
            .move(to:CGPoint(x: self.size.width/2, y: self.size.height/2 + self.radius + 60),
                  duration: 0.05)) { [weak self] in
            self?.tip.physicsBody?.contactTestBitMask = 0b0010
            self?.circle.children.forEach { $0.physicsBody?.contactTestBitMask = 0b0001 }
        }
    }
}

// MARK: - SKPhysicsContactDelegate

extension PrizeWheelScene: SKPhysicsContactDelegate {
    func didEnd(_ contact: SKPhysicsContact) {
        checkWinnings(for: contact)
    }
}
