//
//  Calculator.swift
//  Calculator
//
//  Created by Lingren, Harrison on 5/12/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import Foundation

class Calculator {
    var input,result:Double
    
    init() {
        input = 0
        result = 0
    }
    
    func add(a:Double,b:Double) -> Double {
        return a + b
    }
    
    func exp(a:Double,b:Double) -> Double {
        return pow(a,b)
    }
    
    func subtract(a:Double,b:Double) -> Double {
        return a - b
    }
    
    func multiply(a:Double,b:Double) -> Double {
        return a * b
    }
    
    func divide(a:Double,b:Double) -> Double {
        return a / b
    }
    
    func modulo(a:Double,b:Double) -> Double {
        return a % b
    }
}