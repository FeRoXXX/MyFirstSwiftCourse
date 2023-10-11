//
//  ViewController.swift
//  SequeApp
//
//  Created by Александр Федоткин on 08.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var userName = ""

    @IBOutlet weak var myLable: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad function")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear function")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear function")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear function")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear function")
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        
        userName = nameText.text!
        
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = userName
        }
    }

}

