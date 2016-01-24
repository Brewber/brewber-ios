//
//  ContactsLoaderConfiguration.swift
//  Brewber
//
//  Created by Alex Brashear on 1/23/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit
import APAddressBook

class ContactsLoaderConfiguration: NSObject {
    
    var fieldsMask: APContactField!
    var filterBlock: APFilterContactsBlock!
    var sortDescriptors: [NSSortDescriptor]?
    
    class func defaultConfiguration() -> ContactsLoaderConfiguration {
        let defaultConfiguration = ContactsLoaderConfiguration()
        defaultConfiguration.fieldsMask = [.Name, .PhonesWithLabels, .Birthday, .Thumbnail]
        defaultConfiguration.filterBlock = { (contact: APContact) -> Bool in
            if let phones = contact.phones {
                return phones.count > 0
            }
            return false
        }
        defaultConfiguration.sortDescriptors = [NSSortDescriptor(key: "name.compositeName", ascending: true)]
        return defaultConfiguration
    }
}
