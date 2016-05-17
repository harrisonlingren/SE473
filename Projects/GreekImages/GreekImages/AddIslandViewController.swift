//
//  AddIslandViewController.swift
//  GreekImages
//
//  Created by Lingren, Harrison on 5/17/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit

class AddIslandViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var attractionText: UITextField!
    @IBOutlet weak var imageText: UITextField!
    @IBOutlet weak var urlText: UITextField!
    
    var newIsland:GreekIsland?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "unwindFromSave" {
            print("Unwinding from save action...")
            newIsland = GreekIsland(name: nameText.text!, attractions: attractionText.text!, imageName: imageText.text!, infoUrl: urlText.text!)
            
            
        } else if segue.identifier == "unwindFromCancel" {
            print("Unwinding from cancel action...")
            
        } else {
            print("Incorrect segue identifier")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
