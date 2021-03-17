//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTyping = true
    private var isDecimal = false
    var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display value to Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    var calculatorLogic = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        isDecimal = false
        
        calculatorLogic.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculatorLogic.calculate(symbol: calcMethod) {
                self.displayValue = result
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numButton = sender.currentTitle {
            
            if numButton == "." {
                isFinishedTyping = false
                if isDecimal {
                    return
                }
                isDecimal = true
            }
            
            if isFinishedTyping {
                displayLabel.text = numButton
                isFinishedTyping = false
            } else {
                displayLabel.text?.append(numButton)
            }
        }
    }
}
