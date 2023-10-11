//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Александр Федоткин on 09.10.2023.
//

import UIKit

class ViewController: UIViewController {
    var flag = true
    @IBOutlet weak var narutoImage: UIImageView!
     
    @IBOutlet weak var myLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        narutoImage.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        narutoImage.addGestureRecognizer(gestureRecognizer)
    }

    @objc func changePic(){
        flag = !flag
        if flag{
            narutoImage.image = UIImage(named: "Naruto1")
        }
        else{
            narutoImage.image = UIImage(named: "Naruto2")
        }
    }
}

