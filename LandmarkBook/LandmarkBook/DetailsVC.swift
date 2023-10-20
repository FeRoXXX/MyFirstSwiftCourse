//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Александр Федоткин on 11.10.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landmarkLable: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textfieldNote: UITextField!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    var dataArrayCorrect = [String]()
    var index: Int = 0
    
    var arraySize: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var saveNote = Array(repeating: "", count: arraySize)
        
        landmarkLable.text = selectedLandmarkName
        
        imageView.image = selectedLandmarkImage
        
        saveNote = UserDefaults.standard.object(forKey: "noteArray") as! [String]
        
        if saveNote[index] != ""{
            textfieldNote.text = saveNote[index]
        }
        dataArrayCorrect = UserDefaults.standard.object(forKey: "noteArray") as! [String]
        
    }
    
    @IBAction func textCorrect(_ sender: Any) {
//        dataArrayCorrect.append(textfieldNote.text!)
        dataArrayCorrect[index] = textfieldNote.text!
//        UserDefaults.standard.set(textfieldNote.text, forKey: "Note")
        UserDefaults.standard.set(dataArrayCorrect, forKey: "noteArray")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newData"), object: nil)
    }
    
}
