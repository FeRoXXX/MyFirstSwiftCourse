//
//  ViewController.swift
//  BasicCalculator
//
//  Created by Александр Федоткин on 03.10.2023.
//

import UIKit

class ViewController:
    UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var resultLable: UILabel!
    
    private var resultNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func sumClicked(_ sender: Any) {
        
        if let firstNumber = Int(firstTextField.text!){
            if let secondNumber = Int(secondTextField.text!){
                
                resultNumber = firstNumber + secondNumber
                
                resultLable.text = String(resultNumber)
            }
        }
        
    }
    
    @IBAction func minusClicked(_ sender: Any) {
        
        if let firstNumber = Int(firstTextField.text!){
            if let secondNumber = Int(secondTextField.text!){
                
                resultNumber = firstNumber - secondNumber
                
                resultLable.text = String(resultNumber)
            }
        }
        
    }
    
    @IBAction func divideClicked(_ sender: Any) {
        
        if let firstNumber = Int(firstTextField.text!){
            if let secondNumber = Int(secondTextField.text!){
                
                resultNumber = firstNumber / secondNumber
                
                resultLable.text = String(resultNumber)
            }
        }
        
    }
    
    @IBAction func multiplyClicked(_ sender: Any) {
        
        if let firstNumber = Int(firstTextField.text!){
            if let secondNumber = Int(secondTextField.text!){
                
                resultNumber = firstNumber * secondNumber
                
                resultLable.text = String(resultNumber)
            }
        }
        
    }
    
    
}

