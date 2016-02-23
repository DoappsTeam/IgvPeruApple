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
        
        let url:NSURL = NSURL(string: "http://www.doapps.me/")!
        let request = NSURLRequest(URL: url)
        webViewDoapps.loadRequest(request)
        }

    
}
