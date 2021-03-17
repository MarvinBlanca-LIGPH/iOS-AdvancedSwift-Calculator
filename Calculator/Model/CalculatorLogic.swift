//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Mark Marvin Blanca on 3/17/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number:Double) {
        self.number = number
    }

    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "AC":
                return 0
            case "=":
                return performCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n,calcMethod: symbol)
            }
        }
        return nil
    }
    
    func performCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            default:
                return n1 / n2
            }
        }
        return nil
    }
}
