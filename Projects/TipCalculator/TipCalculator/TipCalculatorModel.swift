//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Lingren, Harrison on 5/11/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import Foundation

class tipCalculator {
    
    var total,taxPct,tipPct:Double
    
    init(total:Double,taxPct:Double,tipPct:Double) {
        self.total = total
        self.taxPct = taxPct
        self.tipPct = tipPct
    }
    
    var subtotal:Double {
        return total / (taxPct + 1)
    }
    
    func calcTip(tipPct:Double) -> Double {
        return round(subtotal * tipPct)
    }
    
    func calcPossibleTips(tipPercentages: [Double]) -> [Int : Double] {
        // create a tipsDictionary [tipPct : tipAmt]
        var tipsDict = [Int : Double] ()
        
        for pct in tipPercentages {
            let intPct = Int(pct * 100) // convert to Int
            tipsDict[intPct] = calcTip(pct)
        }
        
        return tipsDict
    }
}

