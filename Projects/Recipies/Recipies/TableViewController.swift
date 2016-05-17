//
//  TableViewController.swift
//  Recipies
//
//  Created by Lingren, Harrison on 5/17/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var recipieManager = DataStorageManager()
    
    // Connect this to the Add button
    @IBAction func addNewRecipie(sender:AnyObject?) {
        // Declare an Alert controller
        let alert = UIAlertController(title: "New Recipie", message: "Add New Recipie", preferredStyle: .Alert)
        
        // Define the save alert action
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: {
                (action:UIAlertAction) -> Void in
            
            // Declare all text fields for entering data
            let nameField = alert.textFields![0]
            let srcField = alert.textFields![1]
            let descField = alert.textFields![2]
            let ingField = alert.textFields![3]
            let dirField = alert.textFields![4]
            
            // Save the data
            self.recipieManager.insert(nameField.text!, source: srcField.text!, desc: descField.text!, ingredients: ingField.text!, directions: dirField.text!)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: {
            (action:UIAlertAction) -> Void in
        })
        
        // Text fields and placeholders
        alert.addTextFieldWithConfigurationHandler {(textField:UITextField!) -> Void in textField.placeholder = "Name"}
        alert.addTextFieldWithConfigurationHandler {(textField:UITextField!) -> Void in textField.placeholder = "Source"}
        alert.addTextFieldWithConfigurationHandler {(textField:UITextField!) -> Void in textField.placeholder = "Description"}
        alert.addTextFieldWithConfigurationHandler {(textField:UITextField!) -> Void in textField.placeholder = "Ingredients"}
        alert.addTextFieldWithConfigurationHandler {(textField:UITextField!) -> Void in textField.placeholder = "Directions"}
        
        // Add actions
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        recipieManager.select("Recipie")
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipieManager.storedObjects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("textCell", forIndexPath: indexPath)

        // Configure the cell...
        let r = recipieManager.storedObjects[indexPath.row]
        cell.textLabel!.text = r.valueForKey("name") as! String?
        cell.detailTextLabel!.text = r.valueForKey("source") as! String?
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete persistent data from store
            recipieManager.delete(indexPath)
            recipieManager.storedObjects.removeAtIndex(indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "" {
            if let detailsVC = segue.destinationViewController as? DetailsViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let r:NSManagedObject = recipieManager.storedObjects[indexPath.row] as NSManagedObject
                    
                    // Configure the cell
                    detailsVC.name = r.valueForKey("name") as! String?
                    detailsVC.desc = r.valueForKey("desc") as! String?
                    detailsVC.ingredients = r.valueForKey("source") as! String?
                    detailsVC.directions = r.valueForKey("directions") as! String?
                    detailsVC.source = r.valueForKey("source") as! String?
                }
            }
        }
        
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
}
