//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Donald Nguyen on 2/19/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    //no value when init
    private var interCalculation: (n1: Double, calcMethod: String)?
    
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let num = number {
            switch symbol {
                case "+/-":
                    return num * -1
                case "AC":
                    return 0
                case "%":
                    return num  * 0.01
                case "=":
                    return performTwoNumCalculation(n2: num)
                default:
                    interCalculation = (n1: num, calcMethod: symbol)
            }
        }
        return nil

    }
    
   private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = interCalculation?.n1,
            let operation = interCalculation?.calcMethod {
            
            switch operation {
            case "+":
                    return n1 + n2
            case "-":
                    return n1 - n2
            case "×":
                    return n1 * n2
            case "÷":
                    return n1 / n2
            default:
                fatalError()
            }
        }
    
            return nil
   }
}
