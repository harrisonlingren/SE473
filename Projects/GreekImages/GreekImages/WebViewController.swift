//
//  WebViewController.swift
//  GreekImages
//
//  Created by Lingren, Harrison on 5/16/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    var url:String = ""
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let requestedURL = NSURL(string: url)
        let request = NSURLRequest(URL: requestedURL!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
