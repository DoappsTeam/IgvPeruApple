//
//  HistorialViewController.swift
//  IgvPeruApple
//
//  Created by DoApps on 2/13/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit
import CoreData
class HistorialViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var data = [NSManagedObject]()
    @IBOutlet weak var tabla: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.data)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Users")
        do{
            let result = try context.executeFetchRequest(request)
            data = result as! [NSManagedObject]
        }catch let error as NSError {
            print(error.description)
        }
    }
    //MARK: - DataSource methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tabla.dequeueReusableCellWithIdentifier("cell historial", forIndexPath: indexPath)
        cell.textLabel?.text = "hola"
        return cell
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        let user = data[section]
        let name = valueForKey("name") as! String
        return name.uppercaseString
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return data.count
    }
}
