//
//  Quiz+CoreDataProperties.swift
//  
//
//  Created by Home on 5/17/21.
//
//

import Foundation
import CoreData


extension Quiz {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quiz> {
        return NSFetchRequest<Quiz>(entityName: "Quiz")
    }

    @NSManaged public var a1: String?
    @NSManaged public var a2: String?
    @NSManaged public var a3: String?
    @NSManaged public var a4: String?
    @NSManaged public var a5: String?
    @NSManaged public var category: String?
    @NSManaged public var correct1: Bool
    @NSManaged public var correct2: Bool
    @NSManaged public var correct3: Bool
    @NSManaged public var correct4: Bool
    @NSManaged public var correct5: Bool
    @NSManaged public var quizName: String?
    @NSManaged public var r1: String?
    @NSManaged public var r2: String?
    @NSManaged public var r3: String?
    @NSManaged public var r4: String?
    @NSManaged public var r5: String?
    @NSManaged public var r6: String?
    @NSManaged public var r7: String?
    @NSManaged public var r8: String?
    @NSManaged public var r9: String?
    @NSManaged public var r10: String?
    @NSManaged public var r11: String?
    @NSManaged public var r12: String?
    @NSManaged public var r13: String?
    @NSManaged public var r14: String?
    @NSManaged public var r15: String?
    @NSManaged public var score: Double
    @NSManaged public var userName: String?
    @NSManaged public var userQuiz: Account?

}
