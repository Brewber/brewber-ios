//
//  SelectBarTableViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 4/1/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class SelectBarTableViewController: UITableViewController {
    
    let MenuSegueIdentifier = "menuSegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: String(BarTableViewCell), bundle: NSBundle.mainBundle())
        tableView.registerNib(nib, forCellReuseIdentifier: String(BarTableViewCell))
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

// MARK: - TableViewDataSource

extension SelectBarTableViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 30
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(String(BarTableViewCell), forIndexPath: indexPath) as? BarTableViewCell else {
            assertionFailure("Bad")
            return UITableViewCell()
        }
        
        cell.viewModel = BarTableViewCell.ViewModel(barName: "Bar name", barDistance: 20)
        
        return cell
    }
}

// MARK: - TableViewDelegate

extension SelectBarTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier(MenuSegueIdentifier, sender: self)
    }
}

// MARK: - Navigation

extension SelectBarTableViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}
