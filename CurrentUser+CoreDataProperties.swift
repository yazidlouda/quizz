//
//  CurrentUser+CoreDataProperties.swift
//  
//
//  Created by Antonio Torres-Ruiz on 5/11/21.
//
//

import Foundation
import CoreData


extension CurrentUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CurrentUser> {
        return NSFetchRequest<CurrentUser>(entityName: "CurrentUser")
    }

    @NSManaged public var username: String?

}
