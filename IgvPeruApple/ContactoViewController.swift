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
        customNavigationBar()
    }

    @IBAction func buttonShare(sender: AnyObject) {
        let shareText = "Te invito a descargar IGV Perú \n\n https://itunes.apple.com/pe/app/igv-peru/id1086378487?mt=8"
        let activityViewController = UIActivityViewController(activityItems:[shareText], applicationActivities: nil)
            presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK : Cutom Item View
    func customNavigationBar(){
        let imageTitle = UIImageView(image: UIImage(named: "img_header"))
        self.navigationItem.titleView = imageTitle
    }
}
