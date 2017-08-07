//
//  ViewController.swift
//  Calculator
//
//  Created by Jing Wei Li on 7/30/17.
//  Copyright © 2017 Jing Wei Li. All rights reserved.
//~

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var isTyping = false;
    var computedVal:Double = 0
    var result:Double  = 0
    var mode = ""
    private var core = CalculatorCore()
    
    var displayValue: Double{
        get{
            return Double(display.text!)!
        } set {
            display.text = String(newValue)
        }
    }
    
    
    @IBAction func PressNum(_ sender: UIButton) {
        let curr = sender.currentTitle!
        
        if curr == "pi"{
            display.text = "3.1415926"
        } else if isTyping {
            let val = display.text!
            display.text = val + curr
        } else {
            display.text = curr
            isTyping = true
        }
        core.setComputedVal(displayValue)
    }
    
    @IBAction func PerformOperations(_ sender: UIButton) {
        let toCompute = sender.currentTitle!
        core.performCalculations(toCompute)
        if core.isUpdateScreen!{
            displayValue = core.result!
        }
        if core.isNullify! {
            displayValue = 0
        }
        isTyping = false;
    }

}
