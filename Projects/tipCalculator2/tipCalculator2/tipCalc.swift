//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Lingren, Harrison on 5/11/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import Foundation

class tipCalc {
    
    var total,taxPct,tipPct:Double
    
    init(total:Double,taxPct:Double,tipPct:Double) {
        self.total = total
        self.taxPct = taxPct
        self.tipPct = tipPct
    }
    
    var subtotal:Double {
        return total - total * (taxPct/100)
    }
    
    var calcTax:Double {
        return subtotal * (taxPct/100)
    }
    
    var calcTip:Double {
        return subtotal * (tipPct/100)
    }
    
    var calcTotal:Double {
        return subtotal + calcTip + calcTax
    }
    
    func calcPossibleTips(tipPercentages: [Double]) -> [Int : Double] {
        // create a tipsDictionary [tipPct : tipAmt]
        var tipsDict = [Int : Double] ()
        
        for pct in tipPercentages {
            let intPct = Int(pct * 100) // convert to Int
            tipPct = pct
            tipsDict[intPct] = calcTip
        }
        
        return tipsDict
    }
}

