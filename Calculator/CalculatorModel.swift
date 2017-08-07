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
    
    private enum Operations {
        case const(Double)
        // takes a double and returns a double
        case UnaryOperations((Double)-> Double)
    }
    
    
    mutating func performCalculations(_ toCompute: String){
        if isUpdateScreen!{
            updateScreen = false
//            computedResult = 0
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
        case "^":
            computedResult = computedVal
            mode = "^"
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
            case "^":
                let original = computedResult
                let power = Int (computedVal)
                if power == 1 {
                    break
                } else if power == 0{
                    computedResult = 1
                } else {
                    var begin = 1
                    while (begin < power){
                        computedResult *= original
                        begin += 1
                    }
                }
                
            default:
                break
            }
            updateScreen = true
        case "C":
            computedVal = 0
            nullify = true
        case "√":
            if computedResult == 0 {
                computedVal = sqrt(computedVal)
                computedResult = computedVal
            } else {
                computedResult = sqrt(computedResult)
            }
            updateScreen = true
        case "±":
            if computedResult == 0{
                computedVal = -computedVal
                computedResult = computedVal
            } else {
                computedResult = -computedResult
            }
            updateScreen = true
        case "sin":
            if computedResult == 0 {
                computedVal = sin(computedVal)
                computedResult = computedVal
            } else {
                computedResult = sin(computedResult)
            }
            updateScreen = true
        case "cos":
            if computedResult == 0 {
                computedVal = cos(computedVal)
                computedResult = computedVal
            } else {
                computedResult = cos(computedResult)
            }
            updateScreen = true
        case "tan":
            if computedResult == 0 {
                computedVal = tan(computedVal)
                computedResult = computedVal
            } else {
                computedResult = tan(computedResult)
            }
            updateScreen = true
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
