//
//  QuizzViewController.swift
//  TestMe
//
//  Created by Home on 5/11/21.
//

import UIKit

class QuizzViewController: UIViewController {

    @IBOutlet weak var Question: UILabel!
    @IBOutlet var background: UIView!
    
    @IBOutlet weak var nextBut: UIButton!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var A1: UILabel!
    @IBOutlet weak var A2: UILabel!
    @IBOutlet weak var A3: UILabel!
    @IBOutlet weak var A4: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    @IBOutlet weak var typeAnswer: UITextView!
    
    
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
        nextBut.layer.cornerRadius = 10.0
        nextBut.layer.cornerCurve = .continuous
    }
    
    override func viewDidAppear(_ animated: Bool) {
      let db1 = DBHelper.inst.getOneAccount(username: LoginViewController.userId!)
        
        db1.quizzesTaken += 1
        A1.isHidden = true
        A2.isHidden = true
        A3.isHidden = true
        A4.isHidden = true
        typeAnswer.isHidden = true
        btn1.isHidden = true
        btn2.isHidden = true
        btn3.isHidden = true
        btn4.isHidden = true
        Question.text = DashboardViewController.cat
    }
    var isChecked = false
    var score = 0.0
    @IBAction func btn1(_ sender: UIButton) {
        if isChecked{
            let da = DBHelper.inst.getQuestions()
            for q in da {
                if (Question.text == q.q3) {
                    score -= 1.0
                }
            }
            isChecked = false
            let image = UIImage(systemName: "circle")
            sender.setImage(image, for: .normal)
            print(score)
        }
        else{
            
            let da = DBHelper.inst.getQuestions()
            for q in da {
                if (Question.text == q.q3) {
                    score += 1.0
                }
            }
         
            isChecked = true
            let image = UIImage(systemName: "circle.fill")
            sender.setImage(image, for: .normal)
            
            print(score)
        }
        
       
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        if isChecked{
            let da = DBHelper.inst.getQuestions()
            for q in da {
                if (Question.text == q.q2) {
                    
                    score -= 1.0
                }
            }
            
            isChecked = false
            let image = UIImage(systemName: "circle")
            sender.setImage(image, for: .normal)
            print(score)
        }
        else{
            let da = DBHelper.inst.getQuestions()
            for q in da {
                if (Question.text == q.q2) {
                    
                    score += 1.0
                }
                
                
            }
          
            isChecked = true
            let image = UIImage(systemName: "circle.fill")
            sender.setImage(image, for: .normal)
            print(score)
        }
    }
    @IBAction func btn3(_ sender: UIButton) {
        if isChecked{
            let da = DBHelper.inst.getQuestions()
            for q in da {
                if (Question.text == q.q4) {
                    score -= 1.0
                }
            }
            
            isChecked = false
            let image = UIImage(systemName: "circle")
            sender.setImage(image, for: .normal)
            print(score)
        }
        else{
            
            let da = DBHelper.inst.getQuestions()
            for q in da {
                if (Question.text == q.q4) {
                    score += 1.0
                }
            }
            isChecked = true
            let image = UIImage(systemName: "circle.fill")
            sender.setImage(image, for: .normal)
          print(score)
        }
    }
    var x1 = 0
    @IBAction func btn4(_ sender: UIButton) {
        
        if isChecked{

            let da = DBHelper.inst.getQuestions()
            for q in da {
                if (Question.text == q.q1 || Question.text == q.q5) {
                    score -= 1.0
                }

            }
            isChecked = false
            let image = UIImage(systemName: "circle")
            sender.setImage(image, for: .normal)
            print(score)
        }
        else{
            let da = DBHelper.inst.getQuestions()
            for q in da {
                if (Question.text == q.q1 || Question.text == q.q5) {
                    
                    score += 1.0
                }

            }

            isChecked = true
            let image = UIImage(systemName: "circle.fill")
            sender.setImage(image, for: .normal)
            print(score)

        
        }
    }
    
    var x = 0


  
    @IBAction func nextQuestion(_ sender: Any) {
        
        
      let quest =  DBHelper.inst.getQuestions()
        for q in quest{
            if (q.category == DashboardViewController.cat ) {
                
                
                        switch x {
                        case 0:
                            
                           Question.text = q.q1
                            A1.isHidden = false
                            A2.isHidden = false
                            A3.isHidden = false
                            A4.isHidden = false
                            typeAnswer.isHidden = true
                            btn1.isHidden = false
                            btn2.isHidden = false
                            btn3.isHidden = false
                            btn4.isHidden = false
                            isChecked = false
                            x = 1
                        case 1:
                            A1.isHidden = false
                            A2.isHidden = false
                            A3.isHidden = false
                            A4.isHidden = false
                            typeAnswer.isHidden = true
                            btn1.isHidden = false
                            btn2.isHidden = false
                            btn3.isHidden = false
                            btn4.isHidden = false
                            Question.text = q.q2
                            isChecked = false
                            x = 2
                        case 2:
                            A1.isHidden = false
                            A2.isHidden = false
                            A3.isHidden = false
                            A4.isHidden = false
                            typeAnswer.isHidden = true
                            btn1.isHidden = false
                            btn2.isHidden = false
                            btn3.isHidden = false
                            btn4.isHidden = false
                            Question.text = q.q3
                            
                            x = 3
                        case 3:
                            A1.isHidden = false
                            A2.isHidden = false
                            A3.isHidden = false
                            A4.isHidden = false
                            typeAnswer.isHidden = true
                            btn1.isHidden = false
                            btn2.isHidden = false
                            btn3.isHidden = false
                            btn4.isHidden = false
                            Question.text = q.q4
                            
                            x = 4
                         
                        case 4:
                            Question.text = q.q5
                            let db = DBHelper.inst.getAnswers()
                            for a in db {
                                if (a.a5 != nil && typeAnswer.text == a.a5!){
                                    score += 1
                                    print(score)
                                }
                            }
                            x = 5
                        case 5:
                          
                            let db = DBHelper.inst.getAccounts()
                            for i in db {
                                DBHelper.inst.addScore(score: score, username: LoginViewController.userId!)
                                print(score)
                                print(i.scoreOne)
                            }
                           
                          
                            let quiz = self.storyboard?.instantiateViewController(identifier: "dashboard") as! DashboardViewController
                            quiz.modalPresentationStyle = .fullScreen
                            self.present(quiz, animated: true, completion: nil)
                           
                            x = 6
                        default:
                            print("")
                        }
                        

                let data = DBHelper.inst.getAnswersByCategory(category: q.category!)
                           
                            if (Question.text == q.q1){
                                        if(data.a1 != nil){
                                            
                                            A4.text = data.a1
                                            print(data.a1!)
                                        }
                                
                                let data1 = DBHelper.inst.getAnswers()
                                for i in data1{
                                    if (  i.category == DashboardViewController.cat){
                                        if(i.r1 != nil){
                                            A2.text = i.r1
                                        
                                        }
                                        print("no data")
                                        if(i.r2 != nil){
                                            A3.text = i.r2
                                        }
                                        if(i.r3 != nil){
                                            A1.text = i.r3
                                        }
                                    }
                                   
                                }
                                
                                       
                                        
                                        

                            }
                            if (Question.text == q.q2){
                                if(data.a2 != nil){
                                    A2.text = data.a2
                                }
                                let data1 = DBHelper.inst.getAnswers()
                                for i in data1{
                                    if (  i.category == DashboardViewController.cat){
                               
                                A1.text = i.r4
                                A3.text = i.r5
                                A4.text = i.r6
                                }
                                }
                            }
                            if (Question.text == q.q3){
                                let data1 = DBHelper.inst.getAnswers()
                                for i in data1{
                                    if (  i.category == DashboardViewController.cat){
                                if(data.a3 != nil){
                                    A1.text = data.a3
                                }
                                A2.text = i.r7
                                A3.text = i.r8
                                A4.text = i.r9
                                }
                                }
                            }
                            if (Question.text == q.q4){
                                let data1 = DBHelper.inst.getAnswers()
                                for i in data1{
                                    if (  i.category == DashboardViewController.cat){
                                if(data.a4 != nil){
                                    A3.text = data.a4
                                }
                                A2.text = i.r10
                                A1.text = i.r11
                                A4.text = i.r12
                                }
                                }
                            }
                            if (Question.text == q.q5){
                                q.questionType = "tp"
                                A1.isHidden = true
                                                           A2.isHidden = true
                                                           A3.isHidden = true
                                                           A4.isHidden = true
                                                           typeAnswer.isHidden = false
                                                           btn1.isHidden = true
                                                           btn2.isHidden = true
                                                           btn3.isHidden = true
                                                           btn4.isHidden = true
                            }
               
//                            if(q.questionType != nil && q.questionType == "mc"){
//                                typeAnswer.isHidden = true
//                            }
//
//                        if(q.questionType != nil && q.questionType == "tp"){
//                            A1.isHidden = true
//                            A2.isHidden = true
//                            A3.isHidden = true
//                            A4.isHidden = true
//                            typeAnswer.isHidden = false
//                            btn1.isHidden = true
//                            btn2.isHidden = true
//                            btn3.isHidden = true
//                            btn4.isHidden = true
//                        }
                      
                        }
                 
                }
           
        
//        }
    }
    
    @IBAction func getinfo(_ sender: Any) {
        let quest =  DBHelper.inst.getAnswers()
          for a in quest{
//            if (a.category == DashboardViewController.cat ){
                if(a.r1 != nil){
                    
                    print(a.r1!)
                }
                
                else{
                    print ("no data")
                }
//            }
          }
       
    }
}
