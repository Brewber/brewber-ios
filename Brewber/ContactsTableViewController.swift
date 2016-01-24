//
//  ContactsTableViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/23/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit
import APAddressBook

class ContactsTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate, UISearchResultsUpdating {
    
    var contactsLoader: ContactsLoader!
    var contacts: [APContact]?
    let ContactCellIdentifier = "ContactCellIdentifier"
    
    var searchController: UISearchController!
    var filteredContacts: [APContact]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Send To..."
        self.contacts = []
        self.filteredContacts = []
        self.setupNavigationBar()
        self.setupSearchBar()
        self.contactsLoader = ContactsLoader(configuration: ContactsLoaderConfiguration.defaultConfiguration())
        self.loadContacts()
    }
    
    func setupNavigationBar() {        
        // fixes bug where search bar does not show up when tapped
        self.navigationController?.extendedLayoutIncludesOpaqueBars = true
    }
    
    func setupSearchBar() {
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchBar.barTintColor = UIColor.whiteColor()
        
        // this 1px border around searchbar
        self.searchController.searchBar.layer.borderColor = UIColor.whiteColor().CGColor
        self.searchController.searchBar.layer.borderWidth = 1
    }
    
    func loadContacts() {
        if (ContactsLoader.hasAddressBookAccess()) {
            self.contactsLoader.loadContactsWithCompletion { (contacts, error) -> () in
                if (contacts != nil) {
                    self.contacts = contacts
                    self.tableView.reloadData()
                }
                else {
                    print(error?.localizedDescription)
                }
            }
        }
        else {
            self.contactsLoader.requestAccess({ (accessGranted, error) -> () in
                if (accessGranted) {
                    self.loadContacts()
                }
                else {
                    print(error?.localizedDescription)
                }
            })
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.searchController.active) {
            return self.filteredContacts!.count
        }
        else {
            return self.contacts!.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ContactCellIdentifier, forIndexPath: indexPath)
        var currentContact: APContact!
        if (self.searchController.active) {
            currentContact = self.filteredContacts![indexPath.row]
        }
        else {
            currentContact = self.contacts![indexPath.row]
        }
        var nameString: String!
        if (currentContact.name != nil) {
            nameString = currentContact.name!.compositeName
        }
        else {
            nameString = "'name' parameter is nil"
        }
        
        cell.textLabel?.text = nameString
        
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
    
    // MARK: - Search Results Updating Delegate
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredContacts?.removeAll()
        let searchPredicate: NSPredicate = NSPredicate(format: "name.compositeName contains[cd] %@", self.searchController.searchBar.text!)
        let searchResults: [APContact] = self.contacts!.filter { searchPredicate.evaluateWithObject($0) }
        self.filteredContacts = searchResults
        self.tableView.reloadData()
    }
}
