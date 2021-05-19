//
//  ProfileViewController.swift
//  TestMe
//
//  Created by Justin Horner on 5/12/21.
//

import UIKit

class ProfileViewController: UIViewController {
    let cUser = DBHelper.inst.getCurrUser()
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet var background: UIView!
    var rankingOne = [Account]()
    
    override func viewDidLoad() {
        username.text = "Welcome, \(cUser)!"
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
        
        // Create a gradient layer
        let gradientLayer = CAGradientLayer()
        
        // Set the size of the layer to be equal to the size of the display
        gradientLayer.frame = view.bounds
        
        // Set an array of CGColors to create the gradient
        gradientLayer.colors = [#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor, UIColor(red: 50/255, green: 150/255, blue: 150/255, alpha: 1).cgColor]
        
        // Rasterize this layer to improve perfromance
        gradientLayer.shouldRasterize = true
        
        // Apply the gradient to the background
        background.layer.insertSublayer(gradientLayer, at: 0)
        
        // Diagonal: top left to bottom corner
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // top left
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // bottom right
    }
    
    func calcAverage (user :Account) -> Double{
        var average = (user.scoreOne + user.scoreTwo + user.scoreThree + user.scoreFour)/user.quizzesTaken
        print("score2",user.scoreTwo)
        print("score3",user.scoreThree)
        print("score4",user.scoreFour)
        print("quizzesTaken",user.quizzesTaken)
        if (average.isNaN){
            average = 0
        }
        return average
    }
    
    func calculateRankings() {
        let data = DBHelper.inst.getAccounts()
        DBHelper.inst.addTestUser(object: ["test1":"test1"], scores: 1)
        DBHelper.inst.addTestUser(object: ["test2":"test2"], scores: 2)
        DBHelper.inst.addTestUser(object: ["test3":"test3"], scores: 3)
        DBHelper.inst.addTestUser(object: ["test4":"test4"], scores: 4)
        for a in data {
            // compile all of the users' scores
            rankingOne.append(a)
            // sort by average score
            rankingOne.sort(by : ({calcAverage(user: $0) > calcAverage(user: $1)}))
            print(rankingOne)

            // sort in ascending order
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let user = DBHelper.inst.getOneAccount(username: cUser)
        let a = calcAverage(user: user)
        print(a)
        print(user.scoreOne)
        user.scoreOne = a
        score.text = "Average Score: " + String(a)
        calculateRankings()
        rank.text = "Rank: " + String(rankingOne[0].scoreOne + rankingOne[0].scoreTwo + rankingOne[0].scoreThree + rankingOne[0].scoreFour/rankingOne[0].quizzesTaken)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
