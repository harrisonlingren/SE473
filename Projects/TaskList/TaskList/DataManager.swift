//
//  DataManager.swift
//  TaskList
//
//  Created by Lingren, Harrison on 5/18/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class DataManager {
    var myFBref = Firebase(url: "https://tasklistios.firebaseio.com/")
    
    func saveData(objPath:String, data:[String:String]) {
        myFBref.setValue(data, forKey: objPath)
    }
    
    func deleteData(objPath:String) {
        myFBref.valueForKeyPath(objPath)?.removeValue()
    }
    
    func updateData(objPath:String, data:[String:String]) {
        myFBref.setValue(data, forKey: objPath)
    }
    
    func fetchData(objPath:String) -> NSString {
        return myFBref.valueForKeyPath(objPath) as! NSString
    }
    
    func getCount() -> Int {
        return Int((myFBref.valueForKeyPath("tasks")?.childrenCount)!)
    }
    
    
}


