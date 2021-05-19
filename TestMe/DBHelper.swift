//
//  DBHelper.swift
//  TestMe
//
//  Created by Antonio Torres-Ruiz on 5/10/21.
//

import Foundation
import UIKit
import CoreData

class DBHelper {
    static var inst = DBHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addUser(object : [String:String]) { // adds the username and login info to the core data
        let user = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account
        user.username = object["username"]
        user.password = object["password"]
        user.blockedStatus = false
        user.subscriptionStatus = "none"
        user.adminRole = false
        user.feedback = ""
        user.quizzesTaken = 0.0
        user.scoreOne = 0.0
        user.scoreTwo = 0.0
        user.scoreThree = 0.0
        user.scoreFour = 0.0

        do {
            try context?.save()
            print("User created with username:", user.username!, "and password:", user.password!)
        } catch {
            print("Account not created.")
        }
    }
    func addScore(score: Double, username : String) { // adds the username and login info to the core data
        var st = Account()
        
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Account")
        fetchReq.predicate = NSPredicate(format : "username ==%@", username)
        do{
            let stu = try context?.fetch(fetchReq)
            if (stu?.count != 0){
                st = stu?.first as! Account
                st.scoreOne += score
                print("data saved")
            }
           
        }catch
        {
            print("data not updated")
        }
    }
    func getAccounts()->[Account] { // checks through all of the saved users, used primarily to verify login information
        var a = [Account]()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
        do {
            a = try context?.fetch(fetchReq) as! [Account]
        } catch {
            print("Could not find user.")
        }
        
        return a
    }
    
    func getOneAccount (username : String)-> Account { // checks for one specific instance of account credentials to see if it exists in coredata
        var a : Account?
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        
        fetchReq.fetchLimit = 1
        do {
            let req = try context?.fetch(fetchReq) as! [Account]
            if(req.count != 0){
                a = req.first!
            }
            else { // Account data doesn't exist
                print("Account data not found.")
            }
        }
        catch {
            print("Error.")
        }
        
        return a!
    }
    
    func wipeAccounts() { // wipes the core data clean for accounts
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        
        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            print("Everything is reset.")
        } catch let error as NSError {
            print(error)
        }
    }
    
    func addCurrUser(object: String) { // changes object in curruser
//        let currUser = NSEntityDescription.insertNewObject(forEntityName: "CurrentUser", into: context!) as! CurrentUser
        var cUser : [CurrentUser] = []
        cUser.append(NSEntityDescription.insertNewObject(forEntityName: "CurrentUser", into: context!) as! CurrentUser)
//        do{
//            cUser = try context!.fetch(CurrentUser.fetchRequest())
//        }
//        catch{
//            print("error")
//        }
//
        cUser[0].username = object
        
        do {
            try context?.save()
            print("Current user is", cUser[0].username!)
        } catch {
            print("Username not passed properly.")
        }
    }
    func getCurrUser()-> String{
        var cUser : [CurrentUser] = []
        do{
            cUser = try context!.fetch(CurrentUser.fetchRequest())
        }
        catch{
            print("error")
        }
        print(cUser[cUser.count-1].username!)
        return cUser[cUser.count-1].username!
    }
    
    //add questions to database
    func addQuestions(object : [String:String]) {
        let quiz = NSEntityDescription.insertNewObject(forEntityName: "AvailableQuiz", into: context!) as! AvailableQuiz
        quiz.q1 = object["q1"]
        quiz.q2 = object["q2"]
        quiz.q3 = object["q3"]
        quiz.q4 = object["q4"]
        quiz.q5 = object["q5"]
        quiz.category = object["category"]
        quiz.questionType = object["questionType"]
        do {
            try context?.save()
            //print(quiz.q1!)
        } catch {
            print("Questions not created.")
        }
    }
    
    func getQuestions()->[AvailableQuiz] { // checks through all of the saved users, used primarily to verify login information
        var a = [AvailableQuiz]()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "AvailableQuiz")
        do {
            a = try context?.fetch(fetchReq) as! [AvailableQuiz]
        } catch {
            print("Could not find user.")
        }
        
        return a
    }
    
    func getOneQuestion (q1 : String)-> AvailableQuiz { // checks for one specific instance of account credentials to see if it exists in coredata
        var a : AvailableQuiz?
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "AvailableQuiz")
        fetchReq.predicate = NSPredicate(format: "q1 == %@", q1)
        
        fetchReq.fetchLimit = 1
        do {
            let req = try context?.fetch(fetchReq) as! [AvailableQuiz]
            if(req.count != 0){
                a = req.first!
            }
            else { // Account data doesn't exist
                print("Quiz questions not found.")
            }
        }
        catch {
            print("Error.")
        }
        
        return a!
    }
    
    func wipeActiveQuiz() { // wipes the core data clean
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AvailableQuiz")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        
        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            print("Everything is reset.")
        } catch let error as NSError {
            print(error)
        }
    }
    
    func deleteOneUser(username : String){
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Account")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        
        do{
            let st = try context?.fetch(fetchReq)
            context?.delete(st?.first as! Account)
            try context?.save()
            print("User deleted.")
        }
        catch{
//            do{
//                try context?.save()
//                            print("User deleted.")
//            }catch{
//                print("User not deleted.")
//            }
        }
    }
    
    func addAnswerss(object : [String:String]) { // adds the username and login info to the core data
        let answer = NSEntityDescription.insertNewObject(forEntityName: "Quiz", into: context!) as! Quiz
        answer.a1 = object["a1"]
        answer.a2 = object["a2"]
        answer.a3 = object["a3"]
        answer.a4 = object["a4"]
        answer.a5 = object["a5"]
        
        answer.r1 = object["r1"]
        answer.r2 = object["r2"]
        answer.r3 = object["r3"]
        answer.r4 = object["r4"]
        answer.r5 = object["r5"]
        answer.r6 = object["r6"]
        answer.r7 = object["r7"]
        answer.r8 = object["r8"]
        answer.r9 = object["r9"]
        answer.r10 = object["r10"]
        answer.r11 = object["r11"]
        answer.r12 = object["r12"]
        answer.r13 = object["r13"]
        answer.r14 = object["r14"]
        answer.r15 = object["r15"]
        answer.category = object["category"]

        do {
            try context?.save()
            
        } catch {
            print("Answers not created.")
        }
    }
    func getAnswers()->[Quiz] { // checks through all of the saved users, used primarily to verify login information
        var a = [Quiz]()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Quiz")
        do {
            a = try context?.fetch(fetchReq) as! [Quiz]
        } catch {
            print("Could not find Answer.")
        }
        
        return a
    }
    
    func addTestUser(object : [String:String], scores : Double) { // adds the username and login info to the core data
        let user = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context!) as! Account
        user.username = "test"
        user.password = "test"
        user.blockedStatus = false
        user.subscriptionStatus = "none"
        user.adminRole = false
        user.feedback = ""
        user.quizzesTaken = 4.0
        user.scoreOne = scores
        user.scoreTwo = scores
        user.scoreThree = scores
        user.scoreFour = scores

        do {
            try context?.save()
//            print("User created with username:", user.username!, "and password:", user.password!)
        } catch {
            print("Account not created.")
        }
    }
    
    func getAnswersByCategory (category : String)-> Quiz { // checks for one specific instance of account credentials to see if it exists in coredata
            var a : Quiz?
            let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Quiz")
            fetchReq.predicate = NSPredicate(format: "category == %@", category)

            fetchReq.fetchLimit = 1
            do {
                let req = try context?.fetch(fetchReq) as! [Quiz]
                if(req.count != 0){
                    a = req.first!
                }
                else { // Account data doesn't exist
                    print("Quiz Answers not found.")
                }
            }
            catch {
                print("Error.")
            }

            return a!
        }
}
