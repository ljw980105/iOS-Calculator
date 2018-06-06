//
//  HapticFeedbackViewController.swift
//  Calculator
//
//  Created by Jing Wei Li on 1/17/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//

import UIKit
import MarqueeLabel

class HapticFeedbackViewController: UIViewController {
    let selectionHaptic = UISelectionFeedbackGenerator()
    var impactHaptic = UIImpactFeedbackGenerator(style: .light)
    let notificationHaptic = UINotificationFeedbackGenerator()
    @IBOutlet weak var notificationType: UILabel!
    @IBOutlet weak var marqueeLabel: MarqueeLabel!
    var impactLevel = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        marqueeLabel.text = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        notificationType.text = "Error"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //marqueeLabel = MarqueeLabel.init(frame: view.bounds, duration: 5.0, fadeLength: 500)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selected(_ sender: UIButton) {
        selectionHaptic.selectionChanged()
    }
    
    @IBAction func impacted(_ sender: UIButton) {
        switch impactLevel{
        case 1:
            impactHaptic = UIImpactFeedbackGenerator(style: .light)
            impactHaptic.impactOccurred()
            impactLevel += 1
        case 2:
            impactHaptic = UIImpactFeedbackGenerator(style: .medium)
            impactHaptic.impactOccurred()
            impactLevel += 1
        case 3:
            impactHaptic = UIImpactFeedbackGenerator(style: .heavy)
            impactHaptic.impactOccurred()
            impactLevel = 1
        default: break
            
            
        }
    }
    
    @IBAction func notified(_ sender: UIButton) {
        if (notificationType.text! == "Error"){
            notificationHaptic.notificationOccurred(.error)
            notificationType.text = "Success"
        } else if (notificationType.text! == "Success"){
            notificationHaptic.notificationOccurred(.success)
            notificationType.text = "Warning"
        } else if (notificationType.text! == "Warning"){
            notificationHaptic.notificationOccurred(.warning)
            notificationType.text = "Error"
        }
    }
    
}
