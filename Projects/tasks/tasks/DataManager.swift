//
//  DataManager.swift
//  tasks
//
//  Created by Lingren, Harrison on 5/19/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class DataManager {
    // Empty array of objects
    var storedObjects: [NSManagedObject]
    
    init() {
        storedObjects = []
    }
    
    // Get data from a given entity
    func select(entity:String) {
        // Set up managed context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchReq = NSFetchRequest(entityName: entity) // Create a fetch request from the given entity
        
        // Error handling
        do {
            let results = try managedContext.executeFetchRequest(fetchReq)
            storedObjects = results as! [NSManagedObject] // Store result in the data array
        } catch let error as NSError {
            print("Could not get data. Error: \(error), \(error.userInfo)")
        }
    }
    
    
    // Push data to a given entity
    func insert(title:String, notes:String, entityName:String) {
        // Set up managed context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext: managedContext)
        let task = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        // Populate object
        task.setValue(title, forKey: "title")
        task.setValue(notes, forKey: "notes")
        
        // Append to array
        storedObjects.append(task)
        
        // Insert into table
        managedContext.insertObject(task)
        
        // Error handling
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. Error: \(error), \(error.userInfo)")
        }
    }
    
    
    // Delete data from a given entity
    func delete(index:NSIndexPath) {
        // Set up managed context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext

        // Delete the object at the index path
        managedContext.deleteObject(storedObjects[index.row] as NSManagedObject)
        
        // Error handling
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. Error: \(error), \(error.userInfo)")
        }
    }
    
    
    // Update object
    func update(task:NSManagedObject, title:String, notes:String) {
        // Set up managed context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext

        // Populate object
        task.setValue(title, forKey: "title")
        task.setValue(notes, forKey: "notes")
        
        // Error handling
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. Error: \(error), \(error.userInfo)")
        }
        
    }
    
    
}