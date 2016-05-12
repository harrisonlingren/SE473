//
//  ViewController.swift
//  Calculator
//
//  Created by Lingren, Harrison on 5/11/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputText: UILabel!
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var operationText: UILabel!
    
    @IBOutlet weak var t: UIButton!
    
    var operation:String = ""
    var numToAdd:String = ""
    
    var calc:Calculator = Calculator()
    
    @IBAction func numButton(sender: AnyObject) {
        if let numval = Double(String(sender.currentTitle!)) {
            calc.input = numval
        } else {
            //calc.input = 0.0
            if let uwTitle = sender.currentTitle! {
                if numToAdd.isEmpty {
                    numToAdd = uwTitle
                } else {
                   self.numToAdd += uwTitle
                }
                if let num = Double(numToAdd) { calc.input = num }
            } else { print("Could not set number") }
        }
        refreshUI()
    }
    
    @IBAction func equalButton(sender: AnyObject) {
        
        switch operation {
        case "divide":
            calc.input = calc.divide(calc.result, b: calc.input)
            break
        case "modulo":
            calc.input = calc.modulo(calc.result, b: calc.input)
            break
        case "add":
            calc.input = calc.add(calc.result, b: calc.input)
            break
        case "subtract":
            calc.input = calc.subtract(calc.result, b: calc.input)
            break
        case "multiply":
            calc.input = calc.multiply(calc.result, b: calc.input)
            break
        case "exp":
            calc.input = calc.exp(calc.result, b: calc.input)
            break
        default:
            calc.result = calc.input
            break
        }
        numToAdd = ""
        refreshUI()
        operationText.text = "="
    }
    
    @IBAction func divideButton(sender: AnyObject) {
        operation = "divide"
        calc.result = calc.input
        numToAdd = ""
        refreshUI()
    }
    
    @IBAction func moduloButton(sender: AnyObject) {
        operation = "modulo"
        calc.result = calc.input
        numToAdd = ""
        refreshUI()
    }
    
    @IBAction func addButton(sender: AnyObject) {
        operation = "add"
        calc.result = calc.input
        numToAdd = ""
        refreshUI()
    }
    
    @IBAction func subtractButton(sender: AnyObject) {
        operation = "subtract"
        calc.result = calc.input
        numToAdd = ""
        refreshUI()
    }
    
    @IBAction func expButton(sender: AnyObject) {
        operation = "exp"
        calc.result = calc.input
        numToAdd = ""
        refreshUI()
    }
    
    
    @IBAction func multiplyButton(sender: AnyObject) {
        operation = "multiply"
        calc.result = calc.input
        numToAdd = ""
        refreshUI()
    }
    
    @IBAction func decimalButton(sender: AnyObject) {
        numToAdd += "."
        refreshUI()
    }
    
    @IBAction func negateButton(sender: AnyObject) {
        calc.input *= -1
        refreshUI()
    }
    
    @IBAction func clearButton(sender: AnyObject) {
        operation = ""
        calc.input = 0
        calc.result = 0
        numToAdd = ""
        refreshUI()
    }
    
    func refreshUI() {
        let formatter = NSNumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        switch operation {
        case "divide":
            operationText.text = "/"
            break
            
        case "modulo":
            operationText.text = "%"
            break
            
        case "add":
            operationText.text = "+"
            break
            
        case "subtract":
            operationText.text = "-"
            break
            
        case "multiply":
            operationText.text = "*"
            break
            
        case "exp":
            operationText.text = "^"
            break
            
        default:
            operationText.text = ""
            break
        }
        
        inputText.text = formatter.stringFromNumber(calc.input)
        resultText.text = formatter.stringFromNumber(calc.result)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

