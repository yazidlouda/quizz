//
//  RankingViewController.swift
//  TestMe
//
//  Created by Antonio Torres-Ruiz on 5/13/21.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var background: UIView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row {
        case 0:
                        cell.textLabel?.text = "Rank: " + (String(indexPath.row + 1)) + " " + "Score: " + String(4.0) + " " + "Jane"
                    case 1:
                        cell.textLabel?.text = "Rank: " + (String(indexPath.row + 1)) + " " + "Score: " + String(3.0) + " " + "Bill"
                    case 2:
                        cell.textLabel?.text = "Rank: " + (String(indexPath.row + 1)) + " " + "Score: " + String(2.0) + " " + "Phil"
                    case 3:
                        cell.textLabel?.text = "Rank: " + (String(indexPath.row + 1)) + " " + "Score: " + String(1.0) + " " + "Melissa"
                    default:
                        print("error")
                    }
                    return cell
                }
    
    

    @IBOutlet weak var tableView: UITableView!
    // Arrays used to store all of the rankings
    var rankingOne = [Account]()
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        calculateRankings()

        // Do any additional setup after loading the view.
        calculateRankings()
        
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
        if (average.isNaN){
            average = 0
        }
        return average
    }
    
    func calculateRankings() {
        let data = DBHelper.inst.getAccounts()
        DBHelper.inst.addTestUser(object: ["Jane":"Jane"], scores: 1)
                    DBHelper.inst.addTestUser(object: ["Dan":"Dan"], scores: 2)
                    DBHelper.inst.addTestUser(object: ["Phil":"Phil"], scores: 3)
                    DBHelper.inst.addTestUser(object: ["Daria":"Daria"], scores: 4)
        for a in data {
            // compile all of the users' scores
            rankingOne.append(a)
            // sort by average score
            rankingOne.sort(by : ({calcAverage(user: $0) > calcAverage(user: $1)}))
            print(rankingOne)

            // sort in ascending order
        }
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
