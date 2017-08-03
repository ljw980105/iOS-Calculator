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
    var isEmpty = true;
    var computedVal:Double = 0
    var result:Double  = 0
    var mode = ""
    
    var displayValue: Double{
        get{
            return Double(display.text!)!
        } set {
            display.text = String(newValue)
        }
    }
    
    
    @IBAction func PressNum(_ sender: UIButton) {
        let curr = sender.currentTitle!
        
        
        if isTyping {
            let val = display.text!
            display.text = val + curr
        } else {
            display!.text = curr
            isTyping = true
        }
        computedVal = displayValue
    }
    
    @IBAction func PerformOperations(_ sender: UIButton) {
        let toCompute = sender.currentTitle!
        
        switch toCompute {
        case "+":
            result += computedVal
            mode = "+"
        case "-":
            if result == 0{
                result = computedVal
            } else {
                result -= computedVal
            }
            mode = "-"
        case "*":
            if result == 0{
                result = computedVal
            } else {
                result *= computedVal
            }
            mode = "*"
        case "/":
            if result == 0{
                result = computedVal
            } else {
                result /= computedVal
            }
            mode = "/"
        case "=":
            switch mode {
            case "+":
                result += computedVal
            case "-":
                result -= computedVal
            case "*":
                result *= computedVal
            case "/":
                result /= computedVal
            default:
                break
            }
            displayValue = result
            result = 0
        case "C":
            displayValue = 0
            result = 0
        default:
            break
        }
        isTyping = false;

        
    }
    

}
