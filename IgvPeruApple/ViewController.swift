//
//  ViewController.swift
//  IgvPeruApple
//
//  Created by DoApps on 2/13/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calculadoraView: UIView!
    @IBOutlet weak var cronogramaView: UIView!
    @IBOutlet weak var historialView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showContainer(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animateWithDuration(0.5, animations: {
                self.calculadoraView.alpha = 1
                self.cronogramaView.alpha = 0
                self.historialView.alpha = 0
            })
        }
        if sender.selectedSegmentIndex == 1 {
            UIView.animateWithDuration(0.5, animations: {
                self.cronogramaView.alpha = 1
                self.calculadoraView.alpha = 0
                self.historialView.alpha = 0
            })
        }
        if sender.selectedSegmentIndex == 2 {
            UIView.animateWithDuration(0.5, animations: {
                self.historialView.alpha = 1
                self.cronogramaView.alpha = 0
                self.calculadoraView.alpha = 0
            })
        }
    }
    
    // MARK : INIT
    public func initView(){
        self.calculadoraView.alpha = 1
        self.cronogramaView.alpha = 0
        self.historialView.alpha = 0
    }

}

