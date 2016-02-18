//
//  ViewController.swift
//  IgvPeruApple
//
//  Created by DoApps on 2/13/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Variables
    @IBOutlet weak var segmento: UISegmentedControl!
    var igvPageViewController: IGVPageViewController?{
        didSet{
             igvPageViewController?.pageDelegate = self
        }
    }
    
    // MARK : init
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigation()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let igvPVC = segue.destinationViewController as? IGVPageViewController {
            self.igvPageViewController = igvPVC
        }
    }
    
    // MARK : Custom Navigation Bar
    func customNavigation(){
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        //self.navigationController?.navigationBar.barTintColor = UIColor(red: 25/255, green: 117/255, blue: 146/255, alpha: 1.0)
        let imageNav:UIImage = UIImage(named: "button_background")!
        self.navigationController?.navigationBar.setBackgroundImage(imageNav, forBarMetrics: .Default)
        
    }
}


extension ViewController: IGVPageViewControllerDelegate{
    func pageViewController(pageViewController: UIPageViewController, didUpdatePageIndex index: Int) {
        self.segmento.selectedSegmentIndex = index
    }
}

