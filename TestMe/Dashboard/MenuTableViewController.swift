//
//  MenuTableViewController.swift
//  TestMe
//
//  Created by Antonio Torres-Ruiz on 5/10/21.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var textData = ["Profile", "Dashboard", "Subscription", "Rankings", "Feedback", "Log Out"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.backgroundColor = UIColor.init(red: 0, green: 84, blue: 147, alpha: 1.0)
        //#FFD479
        tableView.backgroundColor = UIColor.systemTeal
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return textData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.backgroundColor = UIColor.systemTeal
        cell.textLabel?.text = textData[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("profile selected")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "profile") as! ProfileViewController
            self.present(newViewController, animated: true, completion: nil)
        case 1:
            print("dashboard selected")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "dashboard") as! DashboardViewController
            self.present(newViewController, animated: true, completion: nil)
        case 2:
            print("subscription selected")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "subscription") as! SubscriptionViewController
            self.present(newViewController, animated: true, completion: nil)
        case 3:
            print("rankings selected")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ranking") as! RankingViewController
            self.present(newViewController, animated: true, completion: nil)
        case 4:
            print("feedback selected")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "feedback") as! FeedbackViewController
            self.present(newViewController, animated: true, completion: nil)
        case 5:
            print("logout selected")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "logout") as! LogoutConfirmViewController
            self.present(newViewController, animated: true, completion: nil)
        default:
            print("error")
        }

    }
    
//    func setTableviewBackgroundGradient() {
//        // Create a gradient layer
//        let gradientLayer = CAGradientLayer()
//
//        // Set the size of the layer to be equal to the size of the display
//        gradientLayer.frame = view.bounds
//
//        // Set an array of CGColors to create the gradient
//        gradientLayer.colors = [#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1).cgColor, UIColor(red: 50/255, green: 180/255, blue: 150/255, alpha: 1).cgColor]
//
//        // Rasterize this layer to improve perfromance
//        gradientLayer.shouldRasterize = true
//
//        // Apply the gradient to the background
//       //background.layer.insertSublayer(gradientLayer, at: 0)
//        let backgroundView = UIView(frame: tableView.bounds)
//        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
//        tableView.backgroundView = backgroundView
//    }
//
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.backgroundColor = UIColor.clear
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
