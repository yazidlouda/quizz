//
//  AvailableQuiz+CoreDataProperties.swift
//  
//
//  Created by Home on 5/17/21.
//
//

import Foundation
import CoreData


extension AvailableQuiz {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AvailableQuiz> {
        return NSFetchRequest<AvailableQuiz>(entityName: "AvailableQuiz")
    }

    @NSManaged public var category: String?
    @NSManaged public var name: String?
    @NSManaged public var q1: String?
    @NSManaged public var q1m4: String?
    @NSManaged public var q1mc1: String?
    @NSManaged public var q1mc2: String?
    @NSManaged public var q1mc3: String?
    @NSManaged public var q1mc5: String?
    @NSManaged public var q2: String?
    @NSManaged public var q3: String?
    @NSManaged public var q4: String?
    @NSManaged public var q5: String?
    @NSManaged public var questionType: String?

}
