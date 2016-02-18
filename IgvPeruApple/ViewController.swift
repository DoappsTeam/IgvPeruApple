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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let igvPVC = segue.destinationViewController as? IGVPageViewController {
            self.igvPageViewController = igvPVC
        }
    }
}
extension ViewController: IGVPageViewControllerDelegate{
    func pageViewController(pageViewController: UIPageViewController, didUpdatePageIndex index: Int) {
        self.segmento.selectedSegmentIndex = index
    }
}

