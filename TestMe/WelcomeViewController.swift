//
//  WelcomeViewController.swift
//  TestMe
//
//  Created by Antonio Torres-Ruiz on 5/17/21.
//

import UIKit

class WelcomeViewController: UIViewController {

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
        
        // Loads the view controller containing the sign in screen after 5 seconds
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(loadSignInVC), userInfo: nil, repeats: false)
    }

    
    @objc func loadSignInVC() { // instantiates the view controller containing the sign in screen
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        myVC.modalPresentationStyle = .fullScreen
        self.present(myVC, animated: true, completion: nil)
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
