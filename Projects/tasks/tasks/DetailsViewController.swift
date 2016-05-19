//
//  DetailsViewController.swift
//  tasks
//
//  Created by Lingren, Harrison on 5/19/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var notesText: UITextView!
    
    var taskFromTable:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("DetailsVC: Loaded!")

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
        
        if segue.identifier == "segueEditTask" {
            if let editVC = segue.destinationViewController as? EditViewController {
                // Configure the new view
                print("DetailsVC: Segue to edit...")
            }
            
        } else if segue.identifier == "unwindToTable" {
            if let tableVC = segue.destinationViewController as? TableView { print("DetailsVC: unwinding to table") }
        }
    }
    
    @IBAction func unwindFromUpdateEdit(segue: UIStoryboardSegue) {
        print("DetailsVC: Updating item...")
        if let vc = segue.sourceViewController as? EditViewController {
            self.titleText.text = vc.titleText.text!
            self.notesText.text = vc.notesText.text!
            self.taskFromTable = vc.taskToEdit
        }
    }
}