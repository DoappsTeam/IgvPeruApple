//
//  WebViewController.swift
//  IgvPeruApple
//
//  Created by Bryan Lazaro Cusihuamán on 15/02/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    
    
    @IBOutlet weak var webViewDoapps: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL (string : "http://www.doapps.me/")!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            if error == nil  && data != nil {
                let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.webViewDoapps.loadHTMLString(urlContent, baseURL: url)
                })
                
                print(urlContent)
                
            }
            else {
                print("Ha habido algún error")
            }
        }
        task.resume()
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
