//
//  ViewController.swift
//  MyFirstApplication
//
//  Created by Александр Федоткин on 01.10.2023.
//

import UIKit

class ViewController: UIViewController {
    var flag = true
    @IBOutlet weak var LableOfName: UILabel!
    
    @IBOutlet weak var NarutoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func ChangeButton(_ sender: Any) {
        flag = !flag
        if flag{
            NarutoImage.image = UIImage(named: "Naruto2")
        }
        else{
            NarutoImage.image = UIImage(named:"Naruto1")
        }
    }
    

}

