//
//  ViewController.swift
//  numberGuesser
//
//  Created by Neil Matani on 15/1/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameText: UITextField!
    var name: String = ""
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        nameText.becomeFirstResponder()
        nameText.delegate = self
    }
    
    //start button pressed
    @IBAction func startGameButton(_ sender: UIButton) {
        self.name = nameText.text!
        performSegue(withIdentifier: "nameSegue", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameText.resignFirstResponder()
        return false
    }
    
    
    //prepare segue to take name variable value
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! GuesserViewController
        vc.name = self.name
    }
}

