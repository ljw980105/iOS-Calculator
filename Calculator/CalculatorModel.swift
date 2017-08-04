//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Jing Wei Li on 8/3/17.
//  Copyright © 2017 Jing Wei Li. All rights reserved.
//

import Foundation

struct CalculatorCore {
//    private var computedResult: Double? //initialize at nil
    private var computedResult: Double  = 0
    private var mode = ""
    private var computedVal: Double = 0
    private var updateScreen = false
    private var nullify = false;
    
    
    mutating func performCalculations(_ toCompute: String){
        if isUpdateScreen!{
            updateScreen = false
            computedResult = 0
        }
        
        if nullify {
            nullify = false;
            computedResult = 0
        }
        
        switch toCompute {
        case "+":
            computedResult += computedVal
            mode = "+"
        case "-":
            if computedResult == 0{
                computedResult = computedVal
            } else {
                computedResult -= computedVal
            }
            mode = "-"
        case "*":
            if computedResult == 0{
                computedResult = computedVal
            } else {
                computedResult *= computedVal
            }
            mode = "*"
        case "/":
            if computedResult == 0{
                computedResult = computedVal
            } else {
                computedResult /= computedVal
            }
            mode = "/"
        case "=":
            switch mode {
            case "+":
                computedResult += computedVal
            case "-":
                computedResult -= computedVal
            case "*":
                computedResult *= computedVal
            case "/":
                computedResult /= computedVal
            default:
                break
            }
            updateScreen = true
        case "C":
            nullify = true
        default:
            break
        }
        
        
    }
    
    mutating func setMode(_ operand: String){
        mode = operand
    }
    
    mutating func setComputedVal(_ input: Double){
        computedVal = input
    }
    
    var result: Double? {
        get{
            return computedResult
        }
    }
    
    var isUpdateScreen: Bool? {
        get {
            return updateScreen
        }
    }
    
    var isNullify: Bool? {
        get {
            return nullify
        }
    }
    
    
}
