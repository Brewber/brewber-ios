//
//  SelectBarTableViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 4/1/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class SelectBarTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("barCellIdentifier", forIndexPath: indexPath)

        cell.textLabel?.text = "select bar"

        return cell
    }
}
