    //
//  CronogramaViewController.swift
//  IgvPeruApple
//
//  Created by DoApps on 2/13/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit

class CronogramaViewController: UIViewController,UITableViewDataSource {
    lazy var fechasLine: FechasLine = {
        return FechasLine.fillData()
    }()
    var meses = ["ENERO 2016","FEBRERO 2016","MARZO 2016","ABRIL 2016","MAYO 2016","JUNIO 2016",
        "JULIO 2016","AGOSTO 2016","SEPTIEMBRE 2016","OCTUBRE 2O16","NOVIEMBRE 2016","DICIEMBRE 2016"]
    var array = [Int]()
    
    //Variables
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var rucTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.hidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func search(sender: AnyObject) {
        guard let tf = rucTF.text else{
            return
        }
        let dic = fechasLine.fechas[Int(tf)!]
        let cadena = dic[Int(tf)!]
        self.array = cadena!
        tabla.reloadData()
        tabla.hidden = false
        
    }
    //MARK: - Datasource table methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 12
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tabla.dequeueReusableCellWithIdentifier("cell cronograma", forIndexPath: indexPath) as! IGVTableViewCell
        //let fecha = "\(array[indexPath.row])"
        let fecha = "jajaj"
        cell.configureCellWith(meses[indexPath.row], fech: fecha)
        return cell
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
