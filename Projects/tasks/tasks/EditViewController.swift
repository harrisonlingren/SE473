//
//  EditViewController.swift
//  tasks
//
//  Created by Lingren, Harrison on 5/19/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit
import CoreData

class EditViewController: UIViewController {

    var taskToEdit:NSManagedObject!
    var dm:DataManager!
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var notesText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "unwindFromSaveEdit" {
            print("EditVC: Unwinding from save action")
            
            if let tableVC = segue.destinationViewController as? TableView { print("EditVC: Saving item to table...") }
            else if let detailsVC = segue.destinationViewController as? DetailsViewController { print("EditVC: Updating item in detail view") }
            else { print("EditVC: Could not update item") }
            
        } else {
            print("EditVC: No segue by identifier \(segue.identifier) was found")
        }
    }
}