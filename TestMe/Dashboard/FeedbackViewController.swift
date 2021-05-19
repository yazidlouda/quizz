//
//  FeedbackViewController.swift
//  TestMe
//
//  Created by Antonio Torres-Ruiz on 5/13/21.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var fb: UIButton!
    @IBOutlet var background: UIView!
    @IBOutlet weak var feedback: UITextView!
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
        
        fb.layer.cornerRadius = 10.0
        fb.layer.cornerCurve = .continuous
    }
    
    @IBAction func submitFeedback(_ sender: Any) {
        let cUser = DBHelper.inst.getCurrUser()
        let user = DBHelper.inst.getOneAccount(username: cUser)
        // create the alert
        let alert = UIAlertController(title: "Feedback Received", message: "Thank you for submitting. We are grateful for your comments.", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        // get current user and set its feedback attribute to this input
        user.feedback = feedback.text
        
        feedback.text = "" // clear it so they can input more again
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
