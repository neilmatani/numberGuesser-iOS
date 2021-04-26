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
        nameText.becomeFirstResponder()//set keyboard to automatically appear on nameText
        nameText.delegate = self
        nameText.autocapitalizationType = .sentences //auto capitalize nameText
        overrideUserInterfaceStyle = .light //set app to Light theme
        
    }
    
    //start button pressed
    @IBAction func startGameButton(_ sender: UIButton) {
        self.name = nameText.text!
        performSegue(withIdentifier: "nameSegue", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameText.resignFirstResponder()
        return false
    } //dismiss keyboard when return clicked
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    } //dismiss keyboard when user touches anywhere
    
    
    //prepare segue to take name variable value
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! GuesserViewController
        vc.name = self.name
    }
}

