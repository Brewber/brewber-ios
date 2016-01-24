//
//  ContactsTableViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/23/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit
import APAddressBook

class ContactsTableViewController: UITableViewController {
    
    var contactsLoader: ContactsLoader!
    var contacts: [APContact]?
    let ContactCellIdentifier = "ContactCellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Send To..."
        self.contactsLoader = ContactsLoader(configuration: ContactsLoaderConfiguration.defaultConfiguration())
        self.loadContacts()
    }
    
    func setupNavigationBar() {
        
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
        if (contacts != nil && contacts?.count != 0) {
            return contacts!.count
        }
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ContactCellIdentifier, forIndexPath: indexPath)
        let currentContact: APContact = self.contacts![indexPath.row]
        var nameString: String!
        if (currentContact.name != nil) {
            nameString = self.stringForContactName(currentContact.name!)
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
    
    // MARK: - Private Helper Methods
    
    private func stringForContactName(name: APName) -> String {
        let firstname = name.firstName
        let lastname = name.lastName
        if (firstname != nil && lastname != nil) {
            return "\(firstname!) \(lastname!)"
        }
        else if (firstname != nil) {
            return firstname!
        }
        else if (lastname != nil) {
            return lastname!
        }
        else {
            return "**no name found**"
        }
    }

}
