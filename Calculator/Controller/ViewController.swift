//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTyping : Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else { fatalError()}
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }

    private var calculator = CalculatorLogic()

    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            
            /*
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError()
            } */
            
            //only if a get non nil value, I can update
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        
        
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                if numValue == "."  {
                    
                        let isInt = floor(displayValue) == displayValue
                        
                        if !isInt {
                            return
                        }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

