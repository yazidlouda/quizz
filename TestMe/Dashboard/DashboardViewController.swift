//
//  DashboardViewController.swift
//  TestMe
//
//  Created by Antonio Torres-Ruiz on 5/11/21.
//
import FBSDKLoginKit
import UIKit
import SideMenu
class DashboardViewController: UIViewController {
    @IBOutlet weak var menuBut: UIButton!
    @IBOutlet weak var welcomeTitle: UILabel!
    @IBOutlet var background: UIView!
    var menu : SideMenuNavigationController?
    static var cat = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menu = SideMenuNavigationController(rootViewController: MenuTableViewController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        // Create a gradient layer
        let gradientLayer = CAGradientLayer()
        
        // Set the size of the layer to be equal to the size of the display
        gradientLayer.frame = view.bounds
        
        // Set an array of CGColors to create the gradient
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1).cgColor, UIColor(red: 50/255, green: 180/255, blue: 150/255, alpha: 1).cgColor]
        
        // Rasterize this layer to improve perfromance
        gradientLayer.shouldRasterize = true
        
        // Apply the gradient to the background
        background.layer.insertSublayer(gradientLayer, at: 0)
        
        menuBut.layer.cornerRadius = 10.0
        menuBut.layer.cornerCurve = .continuous
    }

    @IBAction func didTap(_ sender: Any) {
        present(menu!, animated: true)
    }
    
    @IBAction func loadJavaQuiz(_ sender: Any) {
        let data = DBHelper.inst.getQuestions()
        for a in data {
            if(a.category == "java"){
                DashboardViewController.cat = a.category!
                    let quiz = self.storyboard?.instantiateViewController(identifier: "quiz") as! QuizzViewController
                    quiz.modalPresentationStyle = .fullScreen
                    self.present(quiz, animated: true, completion: nil)
                print(DashboardViewController.cat)
            
            }
          
            
        }
        
    }
    
    
    @IBAction func loadPythonQuiz(_ sender: Any) {
        let data = DBHelper.inst.getQuestions()
        for a in data {
            if (a.category == "python"){
                DashboardViewController.cat = a.category!
                let quiz = self.storyboard?.instantiateViewController(identifier: "quiz") as! QuizzViewController
                quiz.modalPresentationStyle = .fullScreen
                self.present(quiz, animated: true, completion: nil)
            }
       
        }
    }
    
    @IBAction func loadCPlusPlus(_ sender: Any) {
        let data = DBHelper.inst.getQuestions()
        for a in data {
            if (a.category == "cpp"){
                DashboardViewController.cat = a.category!
                let quiz = self.storyboard?.instantiateViewController(identifier: "quiz") as! QuizzViewController
                quiz.modalPresentationStyle = .fullScreen
                self.present(quiz, animated: true, completion: nil)
            }
       
        }
    }
    
    @IBAction func loadSwiftQuiz(_ sender: Any) {
        let data = DBHelper.inst.getQuestions()
        for a in data {
            if (a.category == "swift"){
                DashboardViewController.cat = a.category!
                let quiz = self.storyboard?.instantiateViewController(identifier: "quiz") as! QuizzViewController
                quiz.modalPresentationStyle = .fullScreen
                self.present(quiz, animated: true, completion: nil)
            }
       
        }
    }
    
    @IBAction func logoutUser(_ sender: Any) {
        LoginViewController.loginManager.logOut()
        
        print("User logout succesfully")
        let login = self.storyboard?.instantiateViewController(identifier: "login") as! LoginViewController
        login.modalPresentationStyle = .fullScreen
        self.present(login, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
    }
    

}
