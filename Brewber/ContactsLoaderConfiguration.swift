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
    
    
    class func defaultConfiguration() -> ContactsLoaderConfiguration {
        return ContactsLoaderConfiguration()
    }
}
