//
//  SignUpViewController.swift
//  TestMe
//
//  Created by Antonio Torres-Ruiz on 5/10/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet var background: UIView!
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
        
        signUp.layer.cornerRadius = 15.0
        signUp.layer.cornerCurve = .continuous
    }
    
    @IBAction func createAccount(_ sender: Any) {
        let dic = ["username" : userField.text, "password" : passField.text]
        DBHelper.inst.addUser(object: dic as! [String:String])
        
        if (userField.text!.isEmpty == false && passField.text!.isEmpty == false) {
            let alert = UIAlertController(title: "Signed Up", message: "Account created.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
                
            DBHelper.inst.addCurrUser(object: userField.text!)
        } else if (userField.text!.isEmpty && passField.text!.isEmpty) {
            let alert = UIAlertController(title: "Error.", message: "No account details provided. Account not created.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            DBHelper.inst.deleteOneUser(username: "")
        }
        
        userField.text = "" // reset the text fields to empty so the user can create another new user if they wish
        passField.text = ""
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
