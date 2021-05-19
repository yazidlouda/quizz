//
//  CreateanswersViewController.swift
//  TestMe
//
//  Created by Home on 5/11/21.
//

import UIKit

class CreateanswersViewController: UIViewController {

    @IBOutlet var background: UIView!
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var question2: UILabel!
    @IBOutlet weak var question3: UILabel!
    @IBOutlet weak var question4: UILabel!
    @IBOutlet weak var question5: UILabel!
    
    @IBOutlet weak var submit: UIButton!

    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var answer2: UITextField!
    @IBOutlet weak var answer3: UITextField!
    @IBOutlet weak var answer4: UITextField!
    @IBOutlet weak var answer5: UITextField!
    
    @IBOutlet weak var category: UITextField!
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
            
        submit.layer.cornerRadius = 15.0
        submit.layer.cornerCurve = .continuous
    }
    
    @IBAction func submitAnswers(_ sender: Any) {
        
//        let data = DBHelper.inst.getQuestions()
//        for a in data{
//
        
            let dic = ["a1" : answer1.text!, "a2" : answer2.text!, "a3" : answer3.text!, "a4" : answer4.text!, "a5" : answer5.text!, "category" : category.text!]
        DBHelper.inst.addAnswerss(object: dic)
            dump(dic)
        }
//        }
    
//    @IBAction func deleteQuiz(_ sender: Any) {
//        DBHelper.inst.wipeActiveQuiz()
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        let data = DBHelper.inst.getQuestions()
        for a in data{
            question1.text = a.q1!
            question2.text = a.q2!
            question3.text = a.q3!
            question4.text = a.q4!
            question5.text = a.q5!
            category.text = a.category!
            
        }
    }
    
}
