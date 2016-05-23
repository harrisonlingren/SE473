//
//  ViewController.swift
//  firebasedemo
//
//  Created by Lingren, Harrison on 5/23/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    // create reference to Firebase root
    let postRef = FIRDatabase.database().reference()
    var newId = 0
    var newPostText = ""
    
    @IBOutlet weak var postText: UITextField!
    
    @IBAction func sendButton(sender: AnyObject) {
        newPostText = postText.text!
        newId += 1
        
        let newPost = [
            "id" : newId,
            "post" : newPostText
        ]
        let postPath = "posts/\(newId)/"
        
        self.postRef.child(postPath).setValue(newPost)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

