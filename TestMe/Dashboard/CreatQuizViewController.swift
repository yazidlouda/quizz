//
//  CreatQuizViewController.swift
//  TestMe
//
//  Created by Home on 5/11/21.
//

import UIKit

class CreatQuizViewController: UIViewController {
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var question1: UITextField!
    @IBOutlet var background: UIView!
    
    @IBOutlet weak var enterAns: UIButton!
    @IBOutlet weak var question5: UITextField!
    @IBOutlet weak var question4: UITextField!
    @IBOutlet weak var question3: UITextField!
    @IBOutlet weak var question2: UITextField!
    
    @IBOutlet weak var questionType: UITextField!
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
        
        enterAns.layer.cornerRadius = 15.0
        enterAns.layer.cornerCurve = .continuous
    }
    
   
    @IBAction func saveQuestions(_ sender: Any) {
        let dic = ["q1" : question1.text!, "q2" : question2.text!,"q3" : question3.text!,"q4" : question4.text!,"q5" : question5.text!, "category" : category.text!, "questionType" : questionType.text!]
        DBHelper.inst.addQuestions(object: dic)
    }
    
    
}
