//
//  TableViewController.swift
//  PanosRecipesCoreData
//
//  Created by Linos, Panos on 5/8/16.
//  Copyright (c) 2015 Linos, Panos. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var taskManager = DataManager()
    
    //connect this Action with the add (+) button
    @IBAction func addNewRecipe(sender: AnyObject) {
        
        //declare an alert controller
        let alert = UIAlertController(title: "New Recipe", message: "Add New Recipe", preferredStyle: .Alert)
        
        //define the save alert function
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (action: UIAlertAction) -> Void in
            
            //Text fields for entering data
            let titleField = alert.textFields![0]
            let notesField = alert.textFields![1]
            
            //save data
            let dataToSend = [titleField.text!:notesField.text!]
            self.taskManager.saveData("tasks/path-to-data", data: dataToSend)
            
            self.tableView.reloadData()
            
        })
        
        // define the cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction) -> Void in }
        
        //Textfields and placeholders
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            textField.placeholder = "Name"}
        
        alert.addTextFieldWithConfigurationHandler {
            (dirField: UITextField!) -> Void in
            dirField.placeholder = "Directions"}
        
        alert.addTextFieldWithConfigurationHandler {
            (dirField: UITextField!) -> Void in
            dirField.placeholder = "Ingredients"}
        
        //connect the save action to the save button
        alert.addAction(saveAction)
        
        //connect the cancel action with the cancel button
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //taskManager.fetchData("tasks")
        self.tableView.reloadData()

    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return taskManager.getCount()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("textCell", forIndexPath: indexPath)
        
        cell.textLabel!.text = String(taskManager.fetchData("tasks/title") as NSString?)
        cell.detailTextLabel!.text = String(taskManager.fetchData("tasks/notes") as NSString?)
        
        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            //delete persistent data from managedContext
            taskManager.deleteData("tasks/path-to-data")
            
            // Delete the row from the table view
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                
        if segue.identifier == "segueToDetails" {
            
            /*if let detailedVC = segue.destinationViewController as? DetailsViewController {
                
                if let indexPath = tableView.indexPathForSelectedRow {
                    
                    let currentRecipe: NSManagedObject = recipesManager.storedObjects[indexPath.row] as NSManagedObject
                    
                    // configure the currentRecipe
                    detailedVC.name = currentRecipe.valueForKey("name") as? String
                    detailedVC.directions = currentRecipe.valueForKey("directions") as? String
                    detailedVC.ingredients = currentRecipe.valueForKey("ingredients") as? String
                    
                    //pass the currentRecipe to the detailed view
                    detailedVC.recipe = currentRecipe
                    
                }
            }*/
        } else if segue.identifier == "segueToAdd" {
            
        }
    }
}
