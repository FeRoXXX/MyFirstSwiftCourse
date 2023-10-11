//
//  SecondViewController.swift
//  SequeApp
//
//  Created by Александр Федоткин on 08.10.2023.
//

import UIKit

class SecondViewController: UIViewController {
     
    @IBOutlet weak var myLableSecond: UILabel!
    
    @IBOutlet weak var nameLable: UILabel!
    
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLable.text = "Name:" + myName
        
    }
    

}
