//
//  ViewControllerSignIn.swift
//  BasicRegistration
//
//  Created by Александр Федоткин on 08.10.2023.
//

import UIKit

class ViewControllerSignIn: UIViewController {
    
    @IBOutlet weak var signInLable: UILabel!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        usernameText.text = ""
        passwordText.text = ""
    }
    @IBAction func signInClicked(_ sender: Any) {
        if let myUsername = UserDefaults.standard.object(forKey: "username") as? String{
            if let myPassword = UserDefaults.standard.object(forKey: "password") as? String{
                if (myUsername == usernameText.text) && (myPassword == passwordText.text){
                    self.performSegue(withIdentifier: "GoToMenu", sender: self)
                }
                else{
                    MakeAlert(title: "Error!", message: "Incorrect username or password!")
                }
            }
        }
    }
    func MakeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: title, style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
