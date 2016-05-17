//
//  DataStorageManager.swift
//  Recipies
//
//  Created by Lingren, Harrison on 5/17/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataStorageManager {
    // Empty array of objects
    var storedObjects:[NSManagedObject]
    
    init() {
        storedObjects = []
    }
    
    // Get data from a given entity
    func select(entity:String) {
        // Set up the managed context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext

        // Create a fetch request from the given entity
        let fetchRequest = NSFetchRequest(entityName: entity)
        
        // Do block for error handling
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            
            // Store the result in the data
            storedObjects = results as! [NSManagedObject]
            
        } catch let error as NSError {
            print("Could not get data. Error: \(error), \(error.userInfo)")
        }
    }
    
    // Insert recipie
    func insert(name:String, source:String, desc:String, ingredients:String, directions:String) {
        // Set up the managed context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Recipie", inManagedObjectContext: managedContext)
        let recipie = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        // Populate object
        recipie.setValue(name, forKey: "name")
        recipie.setValue(source, forKey: "source")
        recipie.setValue(directions, forKey: "directions")
        recipie.setValue(ingredients, forKey: "ingredients")
        recipie.setValue(desc, forKey: "desc")
        
        // Append to array
        storedObjects.append(recipie)
        
        // Insert into table
        managedContext.insertObject(recipie)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. Error: \(error), \(error.userInfo)")
        }
    }
    
    // Delete object
    func delete(index:NSIndexPath) {
        // set up the managed context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Delete the object at the index path
        managedContext.deleteObject(storedObjects[index.row] as NSManagedObject)
        
        // Use a do block for error handling
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. Error: \(error), \(error.userInfo)")
        }
    }
    
    // Update object
    func update(recipie:NSManagedObject, newName:String, newSource:String, newDir:String, newIng:String, newDesc:String) {
        // set up the managed context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Populate object
        recipie.setValue(newName, forKey: "name")
        recipie.setValue(newSource, forKey: "source")
        recipie.setValue(newDir, forKey: "directions")
        recipie.setValue(newIng, forKey: "ingredients")
        recipie.setValue(newDesc, forKey: "desc")
        
        // Use a do block for error handling
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. Error: \(error), \(error.userInfo)")
        }
    }
}