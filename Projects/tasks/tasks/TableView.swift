//
//  TableView.swift
//  tasks
//
//  Created by Lingren, Harrison on 5/19/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit
import CoreData

class TableView: UITableViewController {

    var taskSent:NSManagedObject!
    var dm = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        dm.select("Task")
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
        return dm.storedObjects.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath)
        
        //configure the cell
        let task = dm.storedObjects[indexPath.row]
        
        cell.textLabel!.text = task.valueForKey("title") as! String?
        cell.detailTextLabel!.text = task.valueForKey("notes") as! String?
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Delete from manager, data entity !!!!!
            dm.delete(indexPath)
            dm.storedObjects.removeAtIndex(indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        
        if segue.identifier == "segueToDetails" {
            if let detailsVC = segue.destinationViewController as? DetailsViewController {
                print("TableVC: Segue to show details...")
                
                let index = tableView.indexPathForSelectedRow?.row
                let task = dm.storedObjects[index!] as NSManagedObject
                detailsVC.titleText.text = task.valueForKey("title") as? String
                detailsVC.notesText.text = task.valueForKey("notes") as? String
                detailsVC.taskFromTable = task
            }
        } else if segue.identifier == "segueToAdd" {
            if let addVC = segue.destinationViewController as? EditViewController {
                print("TableVC: Segue to add item")
                addVC.dm = dm
            }
        } else { print("TableVC: No view found for \(segue.identifier).") }
    }
    
    @IBAction func unwindFromCancelEdit(segue: UIStoryboardSegue) {
        print("TableVC: Unwinding from cancel action")
    }
    
    @IBAction func unwindFromSaveEdit(segue: UIStoryboardSegue) {
        print("TableVC: Saving item to table...")
        if let vc = segue.sourceViewController as? EditViewController {
            dm.insert(vc.titleText.text!, notes: vc.notesText.text!, entityName: "Task")
        }
        self.tableView.reloadData()
    }
    
    @IBAction func returnToTable(segue: UIStoryboardSegue) {
        print("TableVC: Updating table...")
        if let vc = segue.sourceViewController as? DetailsViewController {
            dm.update(vc.taskFromTable, title: vc.titleText.text!, notes: vc.notesText.text!)
        }
        self.tableView.reloadData()
    }
}
