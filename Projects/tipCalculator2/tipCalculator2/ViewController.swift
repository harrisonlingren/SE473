//
//  ViewController.swift
//  tipCalculator2
//
//  Created by Lingren, Harrison on 5/12/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Elements
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var taxText: UILabel!
    @IBOutlet weak var tipText: UILabel!
    
    @IBOutlet weak var finalTipText: UILabel!
    @IBOutlet weak var finalSubtotalText: UILabel!
    @IBOutlet weak var finalTaxText: UILabel!
    @IBOutlet weak var finalTotalText: UILabel!
    
    @IBOutlet weak var taxPctSlider: UISlider!
    @IBOutlet weak var tipPctSlider: UISlider!
    
    var total:Double = 0.0
    var tax:Double = 0.0
    var tip:Double = 0.0
    var tipAmt:Double = 0.0
    
    @IBAction func totalChanged(sender: AnyObject) {
        if let amt = Double(billText.text!) {
            total = amt
        } else {
            total = 0.0
        }
        refreshUI()
    }
    
    @IBAction func taxPctChanged(sender: AnyObject) {
        tax = round(Double(taxPctSlider.value))
        refreshUI()
    }
    
    @IBAction func tipPctChanged(sender: AnyObject) {
        tip = round(Double(tipPctSlider.value))
        refreshUI()
    }
    
    func refreshUI() {
        let tc = tipCalc(total: total, taxPct: tax, tipPct: tip)
        
        billText.text = String(format: "%0.2f", total)
        taxPctSlider.value = Float(tax)
        tipPctSlider.value = Float(tip)
        
        let taxToString = (String(Int(tax)))
        let tipToString = (String(Int(tip)))
        let tipAmtToString = String(format: "%0.2f", tc.calcTip)
        let subAmtToString = String(format: "%0.2f", tc.subtotal)
        let totalToString = String(format: "%0.2f", tc.calcTotal)
        let taxAmtToString = String(format: "%0.2f", tc.calcTax)
            
        taxText.text = "Tax amount: (\(taxToString)%)"
        tipText.text = "Tip amount: (\(tipToString)%)"
        finalTipText.text = "$\(tipAmtToString)"
        finalSubtotalText.text = "$\(subAmtToString)"
        finalTaxText.text = "$\(taxAmtToString)"
        finalTotalText.text = "$\(totalToString)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

