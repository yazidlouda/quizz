//
//  Feedback+CoreDataProperties.swift
//  
//
//  Created by Antonio Torres-Ruiz on 5/10/21.
//
//

import Foundation
import CoreData


extension Feedback {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Feedback> {
        return NSFetchRequest<Feedback>(entityName: "Feedback")
    }

    @NSManaged public var feedback: String?
    @NSManaged public var user: String?
    @NSManaged public var userFeedback: Account?

}
