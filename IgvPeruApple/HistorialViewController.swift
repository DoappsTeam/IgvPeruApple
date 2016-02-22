//
//  HistorialViewController.swift
//  IgvPeruApple
//
//  Created by ayrton toledo on 19/02/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import UIKit
import CoreData
protocol HistorialViewControllerDelegate{
    func ruc(ruc: String)
}
var users = [NSManagedObject]()
class HistorialViewController: UITableViewController {
    //Variables
    var historialDelegate : HistorialViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Users")
        do {
            let results = try context.executeFetchRequest(request)
            users = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell historial", forIndexPath: indexPath)
        let user = users[indexPath.row]
        let ruc = user.valueForKey("ruc") as! String
        let name = user.valueForKey("name") as! String
        cell.textLabel?.text = name.uppercaseString
        cell.detailTextLabel?.text = "RUC: \(ruc)"
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let user = users[indexPath.row]
        let ruc = user.valueForKey("ruc") as! String
        if historialDelegate != nil{
            self.historialDelegate?.ruc(ruc)
        }
    }
    //MARK: - Customize table methods
//    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
//        return 30
//    }
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
//        return 20
//    }
    /*Esto cambia el background del section
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let v = UIView()
        v.backgroundColor = UIColor.redColor()//rojo el background
        return v
    }*/
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            print(indexPath.row)
            print(users[indexPath.row])
            let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context: NSManagedObjectContext = appDel.managedObjectContext
            context.deleteObject(users[indexPath.row])
            do {
                try context.save()
                users.removeAtIndex(indexPath.row)
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
//
//            
////            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
