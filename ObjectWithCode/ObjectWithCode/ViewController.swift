//
//  ViewController.swift
//  ObjectWithCode
//
//  Created by Александр Федоткин on 03.10.2023.
//

import UIKit

class ViewController: UIViewController {

    let myLable = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        myLable.text = "Test Lable"
        myLable.textAlignment = .center
        myLable.frame = CGRect(x: (width * 0.5) - (width * 0.8 * 0.5), y: (height * 0.5) - 25, width: width * 0.8, height: 50)
        view.addSubview(myLable)
        
        let myButton = UIButton()
        myButton.setTitle("My Button", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
        myButton.frame = CGRect(x: (width * 0.5) - (width * 0.8 * 0.5), y: (height * 0.5) + 25, width: width * 0.8, height: 50)
        view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(ViewController.myAction), for: UIControl.Event.touchUpInside)
    }
    @objc func myAction(){
        myLable.text = "Tapped"
    }

}

