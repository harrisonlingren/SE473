//
//  ViewController.swift
//  TipCalculator
//
//  Created by Lingren, Harrison on 5/11/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.

import UIKit

class ViewController: UIViewController {

    // Initial variables
    var total:Double {
        if let totalBillAmt = Double(billAmount.text!) {
            return totalBillAmt
        } else {
            return 0
        }
    }

    var tc:tipCalculator
    var tipAmtBig:String {
        return String(Int(tc.tipPct * 100))
    }
    var taxAmtBig:Int {
        return Int(tc.taxPct * 100)
    }
    
    
    // Elements
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var taxAmountTxt: UILabel!
    @IBOutlet weak var taxAmountSlider: UISlider!
    @IBOutlet weak var tipResultTxt: UILabel!
    
    // Swift functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.billAmount.text = "0.00"
        tc = tipCalculator(total: 0, taxPct: 0, tipPct: 0)
        update()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions
    @IBAction func calculateButton(sender: AnyObject) {
        update()
    }
    
    @IBAction func taxAmountChanged(sender: AnyObject) {
        update()
    }
    
    @IBAction func tipAmountChanged(sender: AnyObject) {
        update()
    }
    
    
    
}

