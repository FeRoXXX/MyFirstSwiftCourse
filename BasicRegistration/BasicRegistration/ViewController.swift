//
//  ViewController.swift
//  BasicRegistration
//
//  Created by Александр Федоткин on 08.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameOfApplicationLable: UILabel!
    
    @IBOutlet weak var actionsLable: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func signInClicked(_ sender: Any) {
        performSegue(withIdentifier: "GoToSignIn", sender: nil)
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        performSegue(withIdentifier: "GoToSignUp", sender: nil)
    }
    
}

