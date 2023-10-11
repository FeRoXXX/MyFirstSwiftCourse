//
//  ViewController.swift
//  TimerProject
//
//  Created by Александр Федоткин on 09.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter = 10
        timerLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counterSum), userInfo: nil, repeats: true)
    }

    @IBAction func buttonClicked(_ sender: Any) {
        print("Button clicked ")
    }
    
    @objc func counterSum(){
        timerLabel.text = "Time: \(counter)"
        counter -= 1
        if counter == 0{
            timer.invalidate()
            timerLabel.text = "Time's over!"
        }
    }
    
}

