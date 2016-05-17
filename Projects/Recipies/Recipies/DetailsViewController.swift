//
//  DetailsViewController.swift
//  Recipies
//
//  Created by Lingren, Harrison on 5/17/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var sourceText: UITextField!
    @IBOutlet weak var descText: UITextView!
    @IBOutlet weak var ingredText: UITextView!
    @IBOutlet weak var dirText: UITextView!
    
    var recipie:NSManagedObject!
    var updateRecipieMgr:DataStorageManager!
    
    var name:String!
    var source:String!
    var directions:String!
    var desc:String!
    var ingredients:String!
    
    @IBAction func updateRecipie(sender: AnyObject?) {
        // update values with new text fields
        name = nameText.text!
        source = sourceText.text!
        directions = dirText.text!
        desc = descText.text!
        ingredients = ingredText.text!
        
        // send the new updated recipie
        updateRecipieMgr.update(recipie, newName: name, newSource: source, newDir: directions, newIng: ingredients, newDesc: description)
        
        // Return to the TableView
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameText.text = name
        sourceText.text = source
        dirText.text = directions
        descText.text = desc
        ingredText.text = ingredients
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
