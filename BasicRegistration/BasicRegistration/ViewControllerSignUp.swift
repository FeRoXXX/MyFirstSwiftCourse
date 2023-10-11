//
//  ViewControllerSignUp.swift
//  BasicRegistration
//
//  Created by Александр Федоткин on 08.10.2023.
//

import UIKit

class ViewControllerSignUp: UIViewController {
    
    @IBOutlet weak var signUpLable: UILabel!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var errorLable: UILabel!
    
    @IBOutlet weak var errorLablePassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameText.layer.borderWidth = 1
        usernameText.layer.cornerRadius = 4
        passwordText.layer.borderWidth = 1
        passwordText.layer.cornerRadius = 4

    }
    
    override func viewWillAppear(_ animated: Bool) {
        usernameText.text = ""
        passwordText.text = ""
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        if usernameText.text == ""{
            MakeAlert(title: "Error!", message: "Incorrect input username")
        }
        else if passwordText.text == "" {
            MakeAlert(title: "Error!", message: "Incorrect input password")
        } else{
            UserDefaults.standard.set(usernameText.text, forKey: "username")
            
            UserDefaults.standard.set(passwordText.text, forKey: "password")
            
            performSegue(withIdentifier: "GoToMenu", sender: nil)
        }
    }
    func MakeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: title, style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
}
