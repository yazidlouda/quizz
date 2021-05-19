//
//  ViewScoresViewController.swift
//  TestMe
//
//  Created by Antonio Torres-Ruiz on 5/11/21.
//

import UIKit

class ViewScoresViewController: UIViewController {

    @IBOutlet weak var display: UIButton!
    @IBOutlet var background: UIView!
    @IBOutlet weak var lb: UILabel!
    var scores = [String]()
    override func viewDidLoad() {
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
        
        display.layer.cornerRadius = 15.0
        display.layer.cornerCurve = .continuous
    }
    
    @IBAction func printAllScores(_ sender: Any) {
        let data = DBHelper.inst.getAccounts()
        var i = 1
        for a in data { // prints the scores of each user with their name and scores on the screen
            scores.append("\(i). \(a.username!) :- Score One: \(a.scoreOne); Score Two: \(a.scoreTwo); Score Three: \(a.scoreThree); Score Four: \(a.scoreFour) \n")
            lb.text = scores.joined()
            i += 1
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
