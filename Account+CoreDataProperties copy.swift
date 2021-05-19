//
//  Account+CoreDataProperties.swift
//  
//
//  Created by Antonio Torres-Ruiz on 5/10/21.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var adminRole: Bool
    @NSManaged public var blockedStatus: Bool
    @NSManaged public var feedback: String?
    @NSManaged public var password: String?
    @NSManaged public var quizzesTaken: Double
    @NSManaged public var scoreFour: Double
    @NSManaged public var scoreOne: Double
    @NSManaged public var scoreThree: Double
    @NSManaged public var scoreTwo: Double
    @NSManaged public var subscriptionStatus: String?
    @NSManaged public var username: String?
    @NSManaged public var userFeedback: Feedback?
    @NSManaged public var userQuiz: Quiz?

}
