//
//  PhoneBookData+CoreDataProperties.swift
//  PhoneBook
//
//  Created by Ade Wija Nugraha on 8/9/17.
//  Copyright © 2017 Ade Wija Nugraha. All rights reserved.
//

import Foundation
import CoreData


extension PhoneBookData {

    @nonobjc public class func phoneBookDatafetchRequest() -> NSFetchRequest<PhoneBookData> {
        return NSFetchRequest<PhoneBookData>(entityName: "PhoneBookData")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?

}
