//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Chichek on 13.11.24.
//

import Foundation

struct CalculatorStruct {
    
    var elements: [Any]
    var numbers: [Int]
    var operators: [String]

    
    init() {
        numbers = Array (0...9)
        operators = ["+","-","*","/","=","C","%"]
        elements = []
        elements.append(contentsOf: numbers)
        elements.append(contentsOf: operators)
    }

}


