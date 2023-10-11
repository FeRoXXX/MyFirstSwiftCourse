//
//  ViewControllerMenu.swift
//  BasicRegistration
//
//  Created by Александр Федоткин on 08.10.2023.
//

import UIKit

class ViewControllerMenu: UIViewController {
    
    @IBOutlet weak var usernameLable: UILabel!
    
    @IBOutlet weak var passwordLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storedUsername = UserDefaults.standard.object(forKey: "username")
        let storedPassword = UserDefaults.standard.object(forKey: "password")
        
        if let myUsername = storedUsername as? String{
            usernameLable.text = "Username: " + myUsername
        }
        
        if let myPassword = storedPassword as? String{
            passwordLable.text = "Password: " + myPassword
        }
    }
    

}
