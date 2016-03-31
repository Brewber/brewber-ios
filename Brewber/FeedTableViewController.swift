//
//  FeedTableViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/24/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    let FeedEventCellIdentifier = "FeedEventCellIdentifier"
    let showSendBeerViewControllerSegue = "showSendBeerViewControllerSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationController!.navigationBar.barTintColor = UIColor.vividRedColor()
        self.title = "Feed"
        self.navigationController?.navigationBar.translucent = false
        
        let titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
        
        let composeButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "composeButtonPressed")
        composeButton.tintColor = UIColor.whiteColor()
        let settingsButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Organize, target: self, action: "settingsButtonPressed")
        settingsButton.tintColor = UIColor.whiteColor()
        
        self.navigationItem.rightBarButtonItem = composeButton
        self.navigationItem.leftBarButtonItem = settingsButton
    }
    
    func composeButtonPressed() {
        self.performSegueWithIdentifier("showSendBeerViewControllerSegue", sender: self)
    }
    
    func settingsButtonPressed() {
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(FeedEventCellIdentifier, forIndexPath: indexPath)

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
