//
//  SearchTableViewController.swift
//  Search
//
//  Created by SANKARA TELUKUTLA on 11/5/15.
//  Copyright © 2015 SANKARA TELUKUTLA. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    
    var allHOLTags = ["#Shankar","#Reddy","#Neel","#Swetha","#Ravi","#Laskhmi","#Niyanth","#Charith","#Bobba","#Yashu","#Krish","#Surendra","#Praveena","#BVRK","#Mamatha","#Avneet","#Karthik","#Vasu","#Seshu","#Srikanth"]
    
    var filteredTags  = [String] ()

    var searchController : UISearchController!
    var resultsController = UITableViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        
        definesPresentationContext = true
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        // Filter through the tags
        
        self.filteredTags = self.allHOLTags.filter { (tag:String) -> Bool in
            if tag.lowercaseString.containsString(self.searchController.searchBar.text!.lowercaseString){
                return true
            }else{
               return  false
            }
        }
        
        //Update the results TableView
        self.resultsController.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableView == self.tableView {
        
            return allHOLTags.count
        }else {
            return self.filteredTags.count
        }
        
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        let cell = UITableViewCell()
        
        if tableView == self.tableView {

        cell.textLabel?.text = self.allHOLTags[indexPath.row]
        }else{
            
            cell.textLabel?.text = self.filteredTags[indexPath.row]
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
