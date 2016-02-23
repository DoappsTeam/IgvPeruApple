//
//  SunatViewController.swift
//  IgvPeruApple
//
//  Created by Bryan Lazaro Cusihuamán on 22/02/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit

class SunatViewController: UIViewController {

    
    @IBOutlet weak var SunatView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url:NSURL = NSURL(string: "http://www.sunat.gob.pe/orientacion/cronogramas/")!
        let request = NSURLRequest(URL: url)
        SunatView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
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
