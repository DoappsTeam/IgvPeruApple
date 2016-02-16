//
//  ContactoViewController.swift
//  IgvPeruApple
//
//  Created by Bryan Lazaro Cusihuamán on 15/02/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit

class ContactoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonShare(sender: AnyObject) {
        let shareText = "Checkout my latest app #coolapp"
        let activityViewController = UIActivityViewController(activityItems:[shareText], applicationActivities: nil)
            presentViewController(activityViewController, animated: true, completion: nil)
        
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
