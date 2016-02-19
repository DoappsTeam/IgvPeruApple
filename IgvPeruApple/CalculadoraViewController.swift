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
            //as
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
                let myString =  textSubt.text!
                let characters = [Character](myString.characters)
                print(characters)
                let contArray = myString.componentsSeparatedByString(".")
                if contArray.count <= 1 {
                    print(contArray[0])
                    if  let subMonto = Double(myString){
                        let igvresult = subMonto * 0.18
                        let totresult = subMonto + igvresult
                        if subMonto % 50 == 0 {
                            let a = String(format : "%.0f" , igvresult)
                            let b = String(format : "%.0f" , totresult)
                            textIGV.text = "\( a )"
                            textTotal.text = "\( b )"
                            }
                        else
                            {
                            let a = String(format : "%.2f" , igvresult)
                            let b = String(format : "%.2f" , totresult)
                            textIGV.text = "\( a )"
                            textTotal.text = "\( b )"
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
                        print(contArray[1])
                        let carac = [Character](contArray[1].characters)
                        print(carac)
                        if  textSubt.text == "\(contArray[0]).." {
                            textSubt.text = "\(contArray[0])."
                        }
                        if carac.count > 1 {
                            textSubt.text = "\(contArray[0]).\(carac[0])\(carac[1])"
                            if  let subMonto = Double(myString){
                                let igvresult = subMonto * 0.18
                                let totresult = igvresult + subMonto
                                if subMonto % 50 == 0 {
                                    let a = String(format : "%.0f" , igvresult)
                                    let b = String(format : "%.0f" , totresult)
                                    textIGV.text = "\( a )"
                                    textTotal.text = "\( b )"
                                    }
                                else
                                    {
                                    let a = String(format : "%.2f" , igvresult)
                                    let b = String(format : "%.2f" , totresult)
                                    textIGV.text = "\( a )"
                                    textTotal.text = "\( b )"
                                    }
                                
                                if carac.count == 3 {
                                    textSubt.text = "\(contArray[0]).\(carac[0])\(carac[1])"
                                    let newValor = Double(textSubt.text!)
                                    let igvresult = newValor! * 0.18
                                    let totresult = igvresult + newValor!
                                    if newValor! % 50 == 0 {
                                        let a = String(format : "%.0f" , igvresult)
                                        let b = String(format : "%.0f" , totresult)
                                        textIGV.text = "\( a )"
                                        textTotal.text = "\( b )"
                                        }
                                    else
                                        {
                                        let a = String(format : "%.2f" , igvresult)
                                        let b = String(format : "%.2f" , totresult)
                                        textIGV.text = "\( a )"
                                        textTotal.text = "\( b )"
                                        }
                                    }
                                }
                            }
                        else
                            {
                            if let subMonto = Double(myString){
                                let igvresult = subMonto * 0.18
                                let qw = igvresult + subMonto
                                if subMonto % 50 == 0 {
                                    let a = String(format : "%.0f" , igvresult)
                                    let b = String(format : "%.0f" , qw)
                                    textIGV.text = "\( a )"
                                    textTotal.text = "\( b )"
                                    }
                                else
                                    {
                                    let a = String(format : "%.2f" , igvresult)
                                    let b = String(format : "%.2f" , qw)
                                    textIGV.text = "\( a )"
                                    textTotal.text = "\( b )"
                                    }
                                }
                            }
                        }
                
                
            case 2 :
                let myString =  textIGV.text!
                let characters = [Character](myString.characters)
                print(characters)
                let contArray = myString.componentsSeparatedByString(".")
                if contArray.count <= 1 {
                    print(contArray[0])
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
                }
            else
                {
                    print(contArray[1])
                    let carac = [Character](contArray[1].characters)
                    print(carac)
                    if  textIGV.text == "\(contArray[0]).." {
                        textIGV.text = "\(contArray[0])."
                    }
                    if carac.count > 1 {
                        textIGV.text = "\(contArray[0]).\(carac[0])\(carac[1])"
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
                            if carac.count == 3 {
                                textIGV.text = "\(contArray[0]).\(carac[0])\(carac[1])"
                                let newValor = Double(textIGV.text!)
                                let subresult = newValor! * 5.55555555555556
                                let totalresult = newValor! + subresult
                                if newValor! % 9 == 0 {
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
                            }
                        }
                    else
                        {
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
                        }
                    }

                
                
            case 3 :
                let myString =  textTotal.text!
                let characters = [Character](myString.characters)
                print(characters)
                let contArray = myString.componentsSeparatedByString(".")
                if  contArray.count <= 1 {
                    print(contArray[0])
                    if  let totalMonto = Double(textTotal.text!) {
                        let igbresult = totalMonto * 0.15254237288136
                        let subresults = totalMonto - igbresult
                        if totalMonto % 59 == 0 {
                            let a = String(format : "%.0f", igbresult)
                            let b = String(format : "%.0f", subresults)
                            textIGV.text = "\( a )"
                            textSubt.text = "\( b )"
                            }
                        else
                            {
                            let a = String(format : "%.2f", igbresult)
                            let b = String(format : "%.2f", subresults)
                            textIGV.text = "\( a )"
                            textSubt.text = "\( b )"
                            }
                        }
                    else
                        {
                        textSubt.text = ""
                        textIGV.text = ""
                        }
                    }
                else
                    {
                        print(contArray[1])
                        let carac = [Character](contArray[1].characters)
                        print(carac)
                        if  textTotal.text == "\(contArray[0]).." {
                            textTotal.text = "\(contArray[0])."
                        }
                        if  carac.count > 1 {
                            textTotal.text = "\(contArray[0]).\(carac[0])\(carac[1])"
                            if  let totalMonto = Double(textTotal.text!) {
                                let igbresult = totalMonto * 0.15254237288136
                                let subresults = totalMonto - igbresult
                                if totalMonto % 59 == 0 {
                                    let a = String(format : "%.0f", igbresult)
                                    let b = String(format : "%.0f", subresults)
                                    textIGV.text = "\( a )"
                                    textSubt.text = "\( b )"
                                    }
                                else
                                    {
                                    let a = String(format : "%.2f", igbresult)
                                    let b = String(format : "%.2f", subresults)
                                    textIGV.text = "\( a )"
                                    textSubt.text = "\( b )"
                                    }
                                if carac.count == 3 {
                                    textTotal.text = "\(contArray[0]).\(carac[0])\(carac[1])"
                                    let newValor = Double(textTotal.text!)
                                    let igbresult = newValor! * 0.15254237288136
                                    let subresults = newValor! - igbresult
                                    if newValor! % 59 == 0 {
                                        let a = String(format : "%.0f", igbresult)
                                        let b = String(format : "%.0f", subresults)
                                        textIGV.text = "\( a )"
                                        textSubt.text = "\( b )"
                                        }
                                    else
                                        {
                                        let a = String(format : "%.2f", igbresult)
                                        let b = String(format : "%.2f", subresults)
                                        textIGV.text = "\( a )"
                                        textSubt.text = "\( b )"
                                        }
                                    }
                                }
                            }
                        else
                            {
                                if  let totalMonto = Double(textTotal.text!) {
                                    let igbresult = totalMonto * 0.15254237288136
                                    let subresults = totalMonto - igbresult
                                    if totalMonto % 59 == 0 {
                                        let a = String(format : "%.0f", igbresult)
                                        let b = String(format : "%.0f", subresults)
                                        textIGV.text = "\( a )"
                                        textSubt.text = "\( b )"
                                        }
                                    else
                                        {
                                        let a = String(format : "%.2f", igbresult)
                                        let b = String(format : "%.2f", subresults)
                                        textIGV.text = "\( a )"
                                        textSubt.text = "\( b )"
                                        }
                                    }
                                }
                            }
                
            default : print("default")
            }
            
        case 19 :
            
            switch sender.tag {
            case 1 :
                let myString =  textSubt.text!
                let characters = [Character](myString.characters)
                print(characters)
                let contArray = myString.componentsSeparatedByString(".")
                if contArray.count <= 1 {
                    print(contArray[0])
                    if  let subMonto = Double(myString){
                        let igvresult = subMonto * 0.19
                        let totresult = subMonto + igvresult
                        if subMonto % 100 == 0 {
                            let a = String(format : "%.0f" , igvresult)
                            let b = String(format : "%.0f" , totresult)
                            textIGV.text = "\( a )"
                            textTotal.text = "\( b )"
                            }
                        else
                            {
                            let a = String(format : "%.2f" , igvresult)
                            let b = String(format : "%.2f" , totresult)
                            textIGV.text = "\( a )"
                            textTotal.text = "\( b )"
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
                    print(contArray[1])
                    let carac = [Character](contArray[1].characters)
                    print(carac)
                    if  textSubt.text == "\(contArray[0]).." {
                        textSubt.text = "\(contArray[0])."
                        }
                    if carac.count > 1 {
                        textSubt.text = "\(contArray[0]).\(carac[0])\(carac[1])"
                        if let subMonto = Double(myString){
                            let igvresult = subMonto * 0.19
                            let totresult = igvresult + subMonto
                            if subMonto % 100 == 0 {
                                let a = String(format : "%.0f" , igvresult)
                                let b = String(format : "%.0f" , totresult)
                                textIGV.text = "\( a )"
                                textTotal.text = "\( b )"
                                }
                            else
                                {
                                let a = String(format : "%.2f" , igvresult)
                                let b = String(format : "%.2f" , totresult)
                                textIGV.text = "\( a )"
                                textTotal.text = "\( b )"
                                }
                            if carac.count == 3 {
                                textSubt.text = "\(contArray[0]).\(carac[0])\(carac[1])"
                                let newValor = Double(textSubt.text!)
                                let igvresult = newValor! * 0.19
                                let totresult = igvresult + newValor!
                                if newValor! % 100 == 0 {
                                    let a = String(format : "%.0f" , igvresult)
                                    let b = String(format : "%.0f" , totresult)
                                    textIGV.text = "\( a )"
                                    textTotal.text = "\( b )"
                                    }
                                else
                                    {
                                    let a = String(format : "%.2f" , igvresult)
                                    let b = String(format : "%.2f" , totresult)
                                    textIGV.text = "\( a )"
                                    textTotal.text = "\( b )"
                                    }
                                }
                            }
                        }
                    else
                        {
                        if let subMonto = Double(myString){
                            let igvresult = subMonto * 0.19
                            let totresult = igvresult + subMonto
                            if subMonto % 100 == 0 {
                                let a = String(format : "%.0f" , igvresult)
                                let b = String(format : "%.0f" , totresult)
                                textIGV.text = "\( a )"
                                textTotal.text = "\( b )"
                                }
                            else
                                {
                                let a = String(format : "%.2f" , igvresult)
                                let b = String(format : "%.2f" , totresult)
                                textIGV.text = "\( a )"
                                textTotal.text = "\( b )"
                                }
                            }
                        }
                    }

            case 2 :
                let myString =  textIGV.text!
                let characters = [Character](myString.characters)
                print(characters)
                let contArray = myString.componentsSeparatedByString(".")
                if contArray.count <= 1 {
                    print(contArray[0])
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
                    }
                else
                    {
                    print(contArray[1])
                    let carac = [Character](contArray[1].characters)
                    print(carac)
                    if  textIGV.text == "\(contArray[0]).." {
                        textIGV.text = "\(contArray[0])."
                        }
                    if carac.count > 1 {
                        textIGV.text = "\(contArray[0]).\(carac[0])\(carac[1])"
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
                            if carac.count == 3 {
                                textIGV.text = "\(contArray[0]).\(carac[0])\(carac[1])"
                                let newValor = Double(textIGV.text!)
                                let subresult = newValor! * 5.26315789473684
                                let totalresult = newValor! + subresult
                                if newValor! % 19 == 0 {
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
                            }
                        }
                    else
                        {
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
                        }
                    }

            case 3 :
                let myString =  textTotal.text!
                let characters = [Character](myString.characters)
                print(characters)
                let contArray = myString.componentsSeparatedByString(".")
                if  contArray.count <= 1 {
                    print(contArray[0])
                    if  let totalMonto = Double(textTotal.text!) {
                        let igbresult = totalMonto * 0.15966386554622
                        let subresults = totalMonto - igbresult
                        if totalMonto % 119 == 0 {
                            let a = String(format : "%.0f", igbresult)
                            let b = String(format : "%.0f", subresults)
                            textIGV.text = "\( a )"
                            textSubt.text = "\( b )"
                            }
                        else
                            {
                            let a = String(format : "%.2f", igbresult)
                            let b = String(format : "%.2f", subresults)
                            textIGV.text = "\( a )"
                            textSubt.text = "\( b )"
                            }
                        }
                    else
                        {
                        textSubt.text = ""
                        textIGV.text = ""
                        }
                    }
                else
                    {
                    print(contArray[1])
                    let carac = [Character](contArray[1].characters)
                    print(carac)
                    if  textTotal.text == "\(contArray[0]).." {
                        textTotal.text = "\(contArray[0])."
                        }
                    if  carac.count > 1 {
                        textTotal.text = "\(contArray[0]).\(carac[0])\(carac[1])"
                        if  let totalMonto = Double(textTotal.text!) {
                            let igbresult = totalMonto * 0.15966386554622
                            let subresults = totalMonto - igbresult
                            if totalMonto % 119 == 0 {
                                let a = String(format : "%.0f", igbresult)
                                let b = String(format : "%.0f", subresults)
                                textIGV.text = "\( a )"
                                textSubt.text = "\( b )"
                                }
                            else
                                {
                                let a = String(format : "%.2f", igbresult)
                                let b = String(format : "%.2f", subresults)
                                textIGV.text = "\( a )"
                                textSubt.text = "\( b )"
                                }
                            if carac.count == 3 {
                                textTotal.text = "\(contArray[0]).\(carac[0])\(carac[1])"
                                let newValor = Double(textTotal.text!)
                                let igbresult = newValor! * 0.15966386554622
                                let subresults = newValor! - igbresult
                                if newValor! % 119 == 0 {
                                    let a = String(format : "%.0f", igbresult)
                                    let b = String(format : "%.0f", subresults)
                                    textIGV.text = "\( a )"
                                    textSubt.text = "\( b )"
                                    }
                                else
                                    {
                                    let a = String(format : "%.2f", igbresult)
                                    let b = String(format : "%.2f", subresults)
                                    textIGV.text = "\( a )"
                                    textSubt.text = "\( b )"
                                    }
                                }
                            }
                        }
                    else
                        {
                        if  let totalMonto = Double(textTotal.text!) {
                            let igbresult = totalMonto * 0.15966386554622
                            let subresults = totalMonto - igbresult
                            if totalMonto % 119 == 0 {
                                let a = String(format : "%.0f", igbresult)
                                let b = String(format : "%.0f", subresults)
                                textIGV.text = "\( a )"
                                textSubt.text = "\( b )"
                                }
                            else
                                {
                                let a = String(format : "%.2f", igbresult)
                                let b = String(format : "%.2f", subresults)
                                textIGV.text = "\( a )"
                                textSubt.text = "\( b )"
                                }
                            }
                        }
                    }
                
            default : print("default")
            }
            
        default : print("default")
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
    }
}