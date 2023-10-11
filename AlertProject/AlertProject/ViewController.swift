//
//  ViewController.swift
//  AlertProject
//
//  Created by Александр Федоткин on 09.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var password2Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signupClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Error!", message: "Username not found !", preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            print("button Clicked!")
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil )
    }
    
    @IBAction func usernameInput(_ sender: Any){
        
        var usernameCheck = usernameText.text
        if usernameCheck == ""{
            let alert = UIAlertController(title: "Error!", message: "Username is empty!", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func passwordInput(_ sender: Any){
        if passwordText.text == ""{
            let alert = UIAlertController(title: "Error!", message: "Password is empty!", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func password2Input(_ sender: Any){
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
        
        if password2Text.text == ""{
            let alertEmpty = UIAlertController(title: "Error!", message: "Passwords don't match!", preferredStyle: UIAlertController.Style.alert)
            
            alertEmpty.addAction(okButton)
            self.present(alertEmpty, animated: true)
        }
        if ((password2Text.text) != passwordText.text){
            let alert = UIAlertController(title: "Error!", message: "Passwords don't match!", preferredStyle: UIAlertController.Style.alert)
    
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }
    
}

