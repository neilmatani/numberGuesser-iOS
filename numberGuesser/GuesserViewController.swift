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
    @IBOutlet weak var guessFeedback: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    var name = ""
    var user = userSession()
    
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        user.userName = name
        nameLabel.text = "Hi \(user.userName!)! "
        userLivesLabel.text = "\(user.lives)"
        NSLog("User target is: %d", user.targetNumber)
        
    }
    
    //display alert when all lives are used.
    func zeroLives(){
        let alert = UIAlertController(title:"You are out of lives!", message:"The target number was \(user.targetNumber)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in self.dismiss(animated: true, completion: nil)})
           
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func invalidInput(){
        let alert = UIAlertController(title:"Invalid Input!", message:"Please enter a number between 0 and 100!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func isStringAnInt(stringNumber: String) -> Bool {
        if let _ = Int(stringNumber) {
            return true
        }
        return false
    }
    
    @IBAction func guessButton(_ sender: Any) {
        let userGuess = guessTextField.text!
        
        if isStringAnInt(stringNumber: userGuess){
            let guessInt: Int = Int(userGuess)!
            if user.lives != 0 {
                NSLog("User guess is: %d", guessInt)
                if guessInt > 0 && guessInt <= 100{
                    if guessInt < user.targetNumber{
                        guessFeedback.text = "Your guess is too LOW!"
                        guessFeedback.isHidden = false
                        user.removeLife()
                        userLivesLabel.text = "\(user.lives)"
                        if user.lives == 0{
                                zeroLives()
                        }
                    }else if guessInt > user.targetNumber{
                        guessFeedback.text = "Your guess is too HIGH!"
                        guessFeedback.isHidden = false
                        user.removeLife()
                        userLivesLabel.text = "\(user.lives)"
                        if user.lives == 0{
                                zeroLives()
                        }
                    }
                    else if guessInt == user.targetNumber{
                        guessFeedback.text = "Your guess is CORRECT!"
                        guessFeedback.textColor = UIColor.green
                        guessFeedback.isHidden = false
                        resetButton.isHidden = false
                        user.removeLife()
                        userLivesLabel.text = "\(user.lives)"
                        
                    }
                    
                }else {invalidInput()}
        
            }
        }else {invalidInput()}
            
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
