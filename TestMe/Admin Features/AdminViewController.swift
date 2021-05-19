//
//  AdminViewController.swift
//  TestMe
//
//  Created by Antonio Torres-Ruiz on 5/10/21.
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet weak var createQuiz: UIButton!
    @IBOutlet var background: UIView!
    @IBOutlet weak var blockUser: UIButton!
    @IBOutlet weak var viewScores: UIButton!
    @IBOutlet weak var logOut: UIButton!
    
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
        
        createQuiz.layer.cornerRadius = 10.0
        createQuiz.layer.cornerCurve = .continuous
        
        blockUser.layer.cornerRadius = 10.0
        blockUser.layer.cornerCurve = .continuous
        
        viewScores.layer.cornerRadius = 10.0
        viewScores.layer.cornerCurve = .continuous
        
        logOut.layer.cornerRadius = 10.0
        logOut.layer.cornerCurve = .continuous
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
