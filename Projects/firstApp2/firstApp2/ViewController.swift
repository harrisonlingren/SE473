//
//  ViewController.swift
//  firstApp2
//
//  Created by Lingren, Harrison on 5/11/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var switchSlideO: UISwitch!
    
    @IBAction func switchSlide(sender: AnyObject) {
        if imageView.hidden {
            imageView.hidden = false
        } else {
            imageView.hidden = true
        }
    }
    
    @IBAction func addButton(sender: AnyObject) {
        welcomeText.text = inputText.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        imageView.hidden = true
        switchSlideO.on = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

