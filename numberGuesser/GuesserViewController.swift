//
//  GuesserViewController.swift
//  numberGuesser
//
//  Created by Neil Matani on 21/1/21.
//

import UIKit

class GuesserViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userLivesLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    var name = ""
    var user = userSession()
    
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        user.userName = name
        nameLabel.text = "Hi \(user.userName!)! "
        userLivesLabel.text = "\(user.lives)"
        NSLog("User guess is: %d", user.targetNumber)
        
    }
    
    @IBAction func guessButton(_ sender: Any) {
        var userGuess = guessTextField.text!
        var guessInt: Int = Int(userGuess)!
        
        if user.lives != 0 {
            NSLog("User guess is: %d", guessInt)
            if guessInt > 0 && guessInt <= 100{
                if guessInt < user.targetNumber{
                    
                }
            }
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
