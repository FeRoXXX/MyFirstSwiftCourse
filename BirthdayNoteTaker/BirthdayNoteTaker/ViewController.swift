//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Александр Федоткин on 05.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var birthdayLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey:  "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let myName = storedName as? String{
            nameLable.text = myName
        }
        if let myBirthday = storedBirthday as? String{
            birthdayLable.text = myBirthday
        }
    }

    @IBAction func saveClick(_ sender: Any) {
        
        UserDefaults.standard.set("Name: \(nameTextField.text!)",  forKey: "name")
        UserDefaults.standard.set("Birthday: \(birthdayTextField.text!)", forKey: "birthday")
        
        nameLable.text = "Name: \(nameTextField.text!)"
        birthdayLable.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    @IBAction func deleteClick(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLable.text = "Name:"
        }
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLable.text = "Birthday:"
        }
        
    }
    
    
}

