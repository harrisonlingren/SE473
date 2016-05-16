//
//  TableViewController.swift
//  GreekImages
//
//  Created by Lingren, Harrison on 5/16/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {
    
    var greekIslands:[GreekIsland] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let corfu = GreekIsland(name: "Corfu", attractions: "Best sand beaches", imageName: "zakynthos.jpg")
        let mykonos = GreekIsland(name: "Mykonos", attractions: "Cosmopolitan lifestyle. Best night life ever.", imageName: "mykonos.jpg")
        let crete = GreekIsland(name: "Crete", attractions: "Biggest island. Has everything for everyone", imageName: "crete.jpg")
        let skiathos = GreekIsland(name: "Skiathos", attractions: "Water sports and activities", imageName: "skiathos.jpg")
        let paros = GreekIsland(name: "Paros", attractions: "Amazing local cuisine", imageName: nil)
        let santorini = GreekIsland(name: "Santorini", attractions: "Best sunset view. Excellent place to get married", imageName: "santorini.jpg")
        
        // Populate the array with all these objects
        greekIslands = [santorini, mykonos, corfu, crete, skiathos, paros]
    }
 
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //something
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return greekIslands.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // get the index of the selected row
        if let indexPath = self.tableView.indexPathForSelectedRow {
            // get a copy of the island contained by the current row so we know what to push into the webview
            
            let webVC = segue.destinationViewController as! WebViewController
            let currentIsland = greekIslands[indexPath.row]
            
            switch currentIsland.name {
                case "Santorini":
                    webVC.url = "https://en.wikipedia.org/wiki/Santorini"
                    break
                case "Mykonos":
                    webVC.url = "https://en.wikipedia.org/wiki/Mykonos"
                    break
                default:
                    webVC.url = ""
                    break
            }
            
        } else {
            print("No selected row")
        }
    }

    
    //create and display table view cells
    override func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as? CustomTableViewCell
        
        // Configure the cell
        let row = indexPath.row
        
        cell!.loadIsland(greekIslands[row].name, attractions: greekIslands[row].attractions, image: greekIslands[row].image!)
        
        return cell!
    }
}