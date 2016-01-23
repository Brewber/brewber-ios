//
//  ContactsLoader.swift
//  Brewber
//
//  Created by Alex Brashear on 1/23/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit
import APAddressBook

class ContactsLoader: NSObject {
    
    let addressBook = APAddressBook()
    
    init(configuration: ContactsLoaderConfiguration) {
        super.init()
        self.setupContactsLoader(configuration)
    }
    
    override init() {
        super.init()
        self.setupContactsLoader(ContactsLoaderConfiguration.defaultConfiguration())
    }
    
    private func setupContactsLoader(configuration: ContactsLoaderConfiguration) {
        self.addressBook.fieldsMask = configuration.fieldsMask
        self.addressBook.filterBlock = configuration.filterBlock
        self.addressBook.sortDescriptors = configuration.sortDescriptors
    }
    
    func requestAccess(completion:(Bool, NSError?) -> ()) {
        self.addressBook.requestAccess { (success, error) -> Void in
            if (success) {
                completion(true, nil)
            }
            else {
                completion(false, error)
            }
        }
    }
    
    class func hasAddressBookAccess() -> Bool {
        switch APAddressBook.access() {
            case APAddressBookAccess.Granted:
                return true
            case APAddressBookAccess.Denied:
                return false
            case APAddressBookAccess.Unknown:
                print("AddressBook access unknown")
                return false
        }
    }
    
    func loadContactsWithCompletion(completion:(([APContact]?, NSError?) -> ())) {
        self.addressBook.loadContacts { (contacts, error) -> Void in
            if (contacts != nil && contacts?.count > 0) {
                completion(contacts!, error)
            }
            else {
                completion(nil, error)
            }
        }
    }

}
