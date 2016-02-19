    //
//  CronogramaViewController.swift
//  IgvPeruApple
//
//  Created by DoApps on 2/13/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit
import CoreData

var rucTemp = 0
protocol CronogramaViewControllerDelegate{
    func guardar(name: String,ruc : String)
}
    
class CronogramaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    lazy var fechasLine: FechasLine = {
        return FechasLine.fillData()
    }()
    var meses1 = ["ENERO 2016","FEBRERO 2016","MARZO 2016","ABRIL 2016","MAYO 2016","JUNIO 2016","JULIO 2016","AGOSTO 2016","SEPTIEMBRE 2016","OCTUBRE 2O16","NOVIEMBRE 2016","DICIEMBRE 2016"]
    var meses2 = ["de Febrero","de Marzo","de Abril","de Mayo","de Junio","de Julio","de Agosto","de Septiembre","de Octubre","de Noviembre","de Diciembre","de Enero"]
    var ultimoDigito = 0
    //Variables
    var cronogramaDelegate : CronogramaViewControllerDelegate? //Delegado
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var rucTF: UITextField!
    //Botones
    @IBOutlet weak var volverABuscarButton: UIButton!
    @IBOutlet weak var buscarButton: UIButton!
    @IBOutlet weak var periodo: UIButton!
    @IBOutlet weak var guardarRucButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if rucTemp != 0{
            rucTF.text = String(rucTemp)
        }
        self.volverABuscarButton.hidden = true
        self.guardarRucButton.hidden = true
        self.periodo.hidden = true
        self.tabla.hidden = true
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
    //MARK: - TextField validacion
    @IBAction func rucTFChanged(sender: AnyObject) {
        if let array = rucTF.text where array != ""{
            let caracteres = [Character](array.characters)
            if caracteres.count > 10{
                rucTF.text = "\(caracteres[0])\(caracteres[1])\(caracteres[2])\(caracteres[3])\(caracteres[4])\(caracteres[5])\(caracteres[6])\(caracteres[7])\(caracteres[8])\(caracteres[9])\(caracteres[10])"
            }
        }
    }
    //MARK: - Boton Buscar
    @IBAction func search(sender: AnyObject) {
        print("boton buscar presionado")
        guard let tf = rucTF.text where tf != ""  else{
            return
        }
        let cadena = [Character](tf.characters)
        let count = cadena.count
        if count == 11{
            let IntegerArray = Int(tf)
            let ultimoDigito = IntegerArray! % 10
            self.ultimoDigito = ultimoDigito
            self.rucTF.resignFirstResponder()
            self.tabla.reloadData()
            self.tabla.hidden = false
            self.volverABuscarButton.hidden = false
            self.guardarRucButton.hidden = false
            self.buscarButton.hidden = true
            self.periodo.hidden = false
        }else{
            print("ponga un ruc valido")
        }
    }
    
    // MARK: - Para toby
    @IBAction func restartSearch(sender: AnyObject) {
        print("volver a buscar presionado")
        
        self.buscarButton.hidden = false
        self.guardarRucButton.hidden = true
        self.tabla.hidden = true
        self.volverABuscarButton.hidden = true
        self.periodo.hidden = true
        self.rucTF.text = ""
    }
    
    
    
    
    
    @IBAction func saveRuc(sender: AnyObject) {
        print("guardar Ruc presionado")
        let alertGuardar = UIAlertController(title: "Guardar RUC", message: "Ponga el nombre", preferredStyle: UIAlertControllerStyle.Alert)
        alertGuardar.addTextFieldWithConfigurationHandler { (nombre) -> Void in
            nombre.placeholder = "Nombre"
        }
        alertGuardar.addAction(UIAlertAction(title: "Guardar", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            let tf = alertGuardar.textFields![0]
            let name = tf.text!
            let ruc = self.rucTF.text!
            if self.cronogramaDelegate != nil{
                self.cronogramaDelegate?.guardar(name, ruc: ruc)
            }
            
        }))
        presentViewController(alertGuardar, animated: true, completion: nil)
    }
    
    //MARK: - Datasource table methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 12
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tabla.dequeueReusableCellWithIdentifier("cell cronograma", forIndexPath: indexPath) as! IGVTableViewCell
        let fechas = fechasLine.fechas
        let fechaUltimoDigito = fechas[self.ultimoDigito]
        let arrayConFechasDePago = fechaUltimoDigito[self.ultimoDigito]
        let num = arrayConFechasDePago![indexPath.row]
        let deMes = meses2[indexPath.row]
        let juntamos = "\(num) \(deMes)"
        cell.configureCellWith(meses1[indexPath.row], fech: juntamos)
        return cell
    }
}
