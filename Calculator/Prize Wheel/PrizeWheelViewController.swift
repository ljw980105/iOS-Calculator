//
//  PrizeWheelViewController.swift
//  Calculator
//
//  Created by Jing Wei Li on 11/22/20.
//  Copyright © 2020 Jing Wei Li. All rights reserved.
//

import UIKit
import SpriteKit

class PrizeWheelViewController: UIViewController {
    @IBOutlet weak var spriteKitView: SKView!
    
    init() {
        super.init(nibName: "PrizeWheelViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Prize Wheel"
        
        spriteKitView.showsFPS = true
        spriteKitView.showsNodeCount = true
        spriteKitView.ignoresSiblingOrder = true
        let scene = PrizeWheelScene(size: spriteKitView.bounds.size)
        scene.scaleMode = .aspectFill
        scene.alert = { [weak self] message, completion in
            let alert = UIAlertController(title: message,message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
            self?.present(alert, animated: true, completion: nil)
        }
        spriteKitView.presentScene(scene)
        
    }
}
