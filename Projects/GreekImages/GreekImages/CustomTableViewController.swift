//
//  CustomTableViewController.swift
//  GreekImages
//
//  Created by Lingren, Harrison on 5/16/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {

    var greekIslands:[GreekIsland] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let corfu = GreekIsland(name: "Corfu", attractions: "Best sand beaches", imageName: "zakynthos.jpg")
        let mykonos = GreekIsland(name: "Mykonos", attractions: "Cosmopolitan lifestyle. Best night life ever.", imageName: "mykonos.jpg")
        let crete = GreekIsland(name: "Crete", attractions: "Biggest island. Has everything for everyone", imageName: "crete.jpg")
        let skiathos = GreekIsland(name: "Skiathos", attractions: "Water sports and activities", imageName: "skiathos.jpg")
        let paros = GreekIsland(name: "Paros", attractions: "Amazing local cuisine", imageName: nil)
        let santorini = GreekIsland(name: "Santorini", attractions: "Best sunset view. Excellent place to get married", imageName: "santorini.jpg")
        
        // Populate the array with all these objects
        greekIslands = [santorini, mykonos, corfu, crete, skiathos, paros]
        
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
        return greekIslands.count
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // get the index of the selected row
        if let indexPath = self.tableView.indexPathForSelectedRow {
            // get a copy of the island contained by the current row so we know what to push into the webview
            
            let webVC = segue.destinationViewController as! WebViewController
            let currentIsland = greekIslands[indexPath.row]
            
            webVC.url = currentIsland.infoUrl
            
        } else {
            print("No selected row")
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as? CustomTableViewCell
        
        // Configure the cell
        let row = indexPath.row
        
        cell!.loadIsland(greekIslands[row].name, attractions: greekIslands[row].attractions, image: greekIslands[row].image!)
        
        return cell!
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
            
            // Delete from the array
            greekIslands.removeAtIndex(indexPath.row)
            
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    /*
        Storyboards provide the ability to go back with an Unwind Segue which can be done in three steps:
        1. create an object/button to select
        2. create an unwind method/action in the controller you want to unwind to
        3. hook up the method in the target controller to the current controller
    */
    
    @IBAction func cancelNewGreekIsland(segue:UIStoryboardSegue) {
        print("Add island action cancelled")
    }
    
    @IBAction func saveNewGreekIsland(segue:UIStoryboardSegue) {
        if let newIslandVC = segue.sourceViewController as? AddIslandViewController {
            // create a new Island
            if let newIsland = newIslandVC.newIsland {
                // append the newIsland in the greekIslands array
                greekIslands.append(newIsland)
                
                //find the new indexPath to insert the new island
                let indexPath = NSIndexPath(forRow: greekIslands.count-1, inSection: 0)
                
                // update the tableview
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        } else {
            
        }
    }
}
