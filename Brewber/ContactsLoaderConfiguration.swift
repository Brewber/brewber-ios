//
//  ContactsLoaderConfiguration.swift
//  Brewber
//
//  Created by Alex Brashear on 1/23/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import APAddressBook

struct ContactsLoaderConfiguration {
    
    var fieldsMask: APContactField!
    var filterBlock: APFilterContactsBlock!
    var sortDescriptors: [NSSortDescriptor]?
    
    static func defaultConfiguration() -> ContactsLoaderConfiguration {
        var defaultConfiguration = ContactsLoaderConfiguration()
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
