//
//  CalculadoraViewController.swift
//  IgvPeruApple
//
//  Created by DoApps on 2/13/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit

class CalculadoraViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let pickerdata = ["18","19"]
    var percent = 18
    var focus = 0
    
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    //MARK: - picker methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerdata.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerdata[row]
    }
    
    // picker view...cambio de 18 a 19
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let pickvalor = pickerdata[row]
        percent = Int(pickvalor)!
        if percent != 18 {
            print("\(textSubt.text!)")
            print("\(textIGV.text!)")
            print("\(textTotal.text!)")
            
            if  let newSub = Double(textSubt.text!) {
                let newIgv = newSub * 0.19
                let newTot = newSub + newIgv
                if  newSub % 100 == 0 {
                    let g = String(format : "%.0f" , newIgv)
                    let h = String(format : "%.0f" , newTot)
                    textIGV.text = "\( g )"
                    textTotal.text = "\( h )"
                    }
                else
                    {
                    let g = String(format : "%.2f" , newIgv)
                    let h = String(format : "%.2f" , newTot)
                    textIGV.text = "\( g )"
                    textTotal.text = "\( h )"
                        
                    }
                }
            else
                {
                textIGV.text = ""
                textTotal.text = ""
                }
            
            }
        else
            {
                print("\(textSubt.text!)")
                print("\(textIGV.text!)")
                print("\(textTotal.text!)")
                
                if let newSub = Double(textSubt.text!) {
                    let newIgv = newSub * 0.18
                    let newTot = newSub + newIgv
                    if  newSub % 50 == 0 {
                        let g = String(format : "%.0f" , newIgv)
                        let h = String(format : "%.0f" , newTot)
                        textIGV.text = "\( g )"
                        textTotal.text = "\( h )"
                        }
                    else
                        {
                        let g = String(format : "%.2f" , newIgv)
                        let h = String(format : "%.2f" , newTot)
                        textIGV.text = "\( g )"
                        textTotal.text = "\( h )"
                    }
                }
                else
                {
                    textIGV.text = ""
                    textTotal.text = ""
                }
        }
        
        print("\(percent)")
    }
    
    
    //MARK: - calculadora metodos
    
    
    @IBOutlet weak var textSubt: UITextField!
    @IBOutlet weak var textIGV: UITextField!
    @IBOutlet weak var textTotal: UITextField!
    
    
    
    @IBAction func ubicacionSub(sender: AnyObject) {
        print("esta en el SUBTOTAL")
        focus = 1
        print("\(focus)")
    }
    @IBAction func ubicacionIGV(sender: AnyObject) {
        print("esta en el IGV")
        focus = 2
        print("\(focus)")
    }
    @IBAction func ubicacionTotal(sender: AnyObject) {
        print("esta en el TOTAL")
        focus = 3
        print("\(focus)")
    }
    
    @IBAction func getFocus(sender: AnyObject) {
        
        switch percent {
        case 18 :
            switch sender.tag {
            case 1 :
                print("\(textSubt.text!)")
                if  let subMonto = Double(textSubt.text!){
                    let igvresult = subMonto * 0.18
                    let totresult = subMonto + igvresult
                    if subMonto % 50 == 0 {
                        let e = String(format : "%.0f" , igvresult)
                        let f = String(format : "%.0f" , totresult)
                        textIGV.text = "\( e )"
                        textTotal.text = "\( f )"
                        }
                    else
                        {
                        let e = String(format : "%.2f" , igvresult)
                        let f = String(format : "%.2f" , totresult)
                        textIGV.text = "\( e )"
                        textTotal.text = "\( f )"
                    }
                }
                else
                {
                    textIGV.text = ""
                    textTotal.text = ""
                }
                
            case 2 :
                print("\(textIGV.text!)")
                if  let igvMonto = Double(textIGV.text!) {
                    let subresult = igvMonto * 5.55555555555556
                    let totalresult = igvMonto + subresult
                    if igvMonto % 9 == 0 {
                        let a = String(format : "%.0f" , subresult)
                        let b = String(format : "%.0f", totalresult)
                        textSubt.text = "\( a )"
                        textTotal.text = "\( b )"
                    }
                    else
                    {
                        let a = String(format : "%.2f" , subresult)
                        let b = String(format : "%.2f", totalresult)
                        textSubt.text = "\( a )"
                        textTotal.text = "\( b )"
                    }
                }
                else
                {
                    textTotal.text = ""
                    textSubt.text = ""
                }
                
            case 3 :
                print("\(textTotal.text!)")
                if  let totalMonto = Double(textTotal.text!) {
                    let igbresult = totalMonto * 0.15254237288136
                    let subresults = totalMonto - igbresult
                    if totalMonto % 59 == 0 {
                        let c = String(format : "%.0f", igbresult)
                        let d = String(format : "%.0f", subresults)
                        textIGV.text = "\( c )"
                        textSubt.text = "\( d )"
                    }
                    else
                    {
                        let c = String(format : "%.2f", igbresult)
                        let d = String(format : "%.2f", subresults)
                        textIGV.text = "\( c )"
                        textSubt.text = "\( d )"
                    }
                }
                else
                {
                    textSubt.text = ""
                    textIGV.text = ""
                }
                
            default : print("default")
            }
            
        case 19 :
            
            switch sender.tag {
            case 1 :
                print("\(textSubt.text!)")
                if  let subMonto = Double(textSubt.text!){
                    let igvresult = subMonto * 0.19
                    let totresult = subMonto + igvresult
                    if subMonto % 100 == 0 {
                        let e = String(format : "%.0f" , igvresult)
                        let f = String(format : "%.0f" , totresult)
                        textIGV.text = "\( e )"
                        textTotal.text = "\( f )"
                        }
                    else
                        {
                        let e = String(format : "%.2f" , igvresult)
                        let f = String(format : "%.2f" , totresult)
                        textIGV.text = "\( e )"
                        textTotal.text = "\( f )"
                        
                    }
                }
                else
                {
                    textIGV.text = ""
                    textTotal.text = ""
                }
                
            case 2 :
                print("\(textIGV.text!)")
                if  let igvMonto = Double(textIGV.text!) {
                    let subresult = igvMonto * 5.26315789473684
                    let totalresult = igvMonto + subresult
                    if igvMonto % 19 == 0 {
                        let a = String(format : "%.0f" , subresult)
                        let b = String(format : "%.0f", totalresult)
                        textSubt.text = "\( a )"
                        textTotal.text = "\( b )"
                    }
                    else
                    {
                        let a = String(format : "%.2f" , subresult)
                        let b = String(format : "%.2f", totalresult)
                        textSubt.text = "\( a )"
                        textTotal.text = "\( b )"
                    }
                }
                else
                {
                    textTotal.text = ""
                    textSubt.text = ""
                }
                
            case 3 :
                print("\(textTotal.text!)")
                if  let totalMonto = Double(textTotal.text!) {
                    let igbresult = totalMonto * 0.15966386554622
                    let subresults = totalMonto - igbresult
                    if totalMonto % 119 == 0 {
                        let c = String(format : "%.0f", igbresult)
                        let d = String(format : "%.0f", subresults)
                        textIGV.text = "\( c )"
                        textSubt.text = "\( d )"
                    }
                    else
                    {
                        let c = String(format : "%.2f", igbresult)
                        let d = String(format : "%.2f", subresults)
                        textIGV.text = "\( c )"
                        textSubt.text = "\( d )"
                    }
                }
                else
                {
                    textSubt.text = ""
                    textIGV.text = ""
                }
                
            default : print("default")
            }
            
        default : print("default")
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
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
