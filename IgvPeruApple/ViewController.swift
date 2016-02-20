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
    var igvPageViewController: IGVPageViewController?
    var actual = 0
    // MARK : init
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "page"{
            if let pageVC = segue.destinationViewController as? IGVPageViewController{
                self.igvPageViewController = pageVC
                self.igvPageViewController?.pageDelegate = self
            }
        }
    }
    //MARK: - SegmentoChanged solo escribo esto para comitear
    
    @IBAction func segmentoChanged(sender: UISegmentedControl) {
        let toPage = sender.selectedSegmentIndex
        print("toPage",toPage)
        if toPage == 0 && toPage != actual{
            let vc = storyboard?.instantiateViewControllerWithIdentifier("calculadora")
            igvPageViewController!.setViewControllers([vc!], direction: .Reverse, animated: true, completion: nil)
            igvPageViewController?.notifyDelegateOfNewIndex()
        }else if toPage == 1 && toPage != actual && actual == 0{
            let vc = storyboard?.instantiateViewControllerWithIdentifier("cronograma")
            igvPageViewController!.setViewControllers([vc!], direction: .Forward, animated: true, completion: nil)
            (vc as! CronogramaViewController).cronogramaDelegate = self.igvPageViewController
            igvPageViewController?.notifyDelegateOfNewIndex()
        }else if toPage == 1 && toPage != actual && actual == 2{
            let vc = storyboard?.instantiateViewControllerWithIdentifier("cronograma")
            igvPageViewController!.setViewControllers([vc!], direction: .Reverse, animated: true, completion: nil)
            (vc as! CronogramaViewController).cronogramaDelegate = self.igvPageViewController
            igvPageViewController?.notifyDelegateOfNewIndex()
        }else if toPage == 2 && toPage != actual{
            let vc = storyboard?.instantiateViewControllerWithIdentifier("historial")
            igvPageViewController!.setViewControllers([vc!], direction: .Forward, animated: true, completion: nil)
            (vc as! HistorialViewController).historialDelegate = self.igvPageViewController
            igvPageViewController?.notifyDelegateOfNewIndex()
        }
    }
    
    // MARK : Custom Navigation Bar
    func customNavigationBar(){
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        //self.navigationController?.navigationBar.barTintColor = UIColor(red: 25/255, green: 117/255, blue: 146/255, alpha: 1.0)
        
        let imageNav:UIImage = UIImage(named: "button_background")!
        self.navigationController?.navigationBar.setBackgroundImage(imageNav, forBarMetrics: .Default)
        
        let imageTitle = UIImageView(image: UIImage(named: "img_header"))
        self.navigationItem.titleView = imageTitle
    }
}


extension ViewController: IGVPageViewControllerDelegate{
    func pageViewController(pageViewController: UIPageViewController, didUpdatePageIndex index: Int) {
        self.segmento.selectedSegmentIndex = index
        self.actual = index
        print("actual",self.actual)
    }
}

