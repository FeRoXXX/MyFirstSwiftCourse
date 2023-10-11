//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Александр Федоткин on 10.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLable: UILabel!
    
    @IBOutlet weak var scoreLable: UILabel!
    
    @IBOutlet weak var highscoreLable: UILabel!
    
    @IBOutlet weak var kennyImage: UIImageView!
    
    @IBOutlet weak var startLable: UILabel!
    
    var timer = Timer()
    var counter = 30
    var startTimeCounter = 5
    
    var width: CGFloat = 0.0
    var height: CGFloat = 0.0
    var imageWidth: CGFloat = 0.0
    var imageHeight: CGFloat = 0.0
    
    var score = 0
    var highscore = 0
    
    var speedTimer = Timer()
    var startTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimg")!)
        
        let storedHighScore = UserDefaults.standard.object(forKey: "Highscore")
        
        if storedHighScore == nil{
            highscoreLable.text = "Highstore: 0"
        }
        if let newScore = storedHighScore as? Int{
            highscoreLable.text = "Highstore: \(newScore)"
            highscore = newScore
        }
        kennyImage.isUserInteractionEnabled = true
        
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func startCounter(){
        startLable.text = "\(startTimeCounter - 2)"
        startTimeCounter -= 1
        if startTimeCounter < 2{
            startLable.text = "Start Game!"
        }
        if startTimeCounter == 0{
            startTimer.invalidate()
            startTimeCounter = 5
            startLable.text = ""
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(gameStart), userInfo: nil, repeats: true)
            
            speedTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(imageDraw), userInfo: nil, repeats: true)
        }
    }
    
    @objc func gameStart(){
        
        kennyImage.isUserInteractionEnabled = true
        
        let gestureReconizer = UITapGestureRecognizer(target: self, action: #selector(tappedOnImage))
        
        gestureReconizer.numberOfTapsRequired = 1
        
        kennyImage.addGestureRecognizer(gestureReconizer)
        
        counter -= 1
        
        timeLable.text = "Time: \(counter)"
        
        if counter == 0{
            
            timer.invalidate()
            speedTimer.invalidate()
            
            MakeAlert()
        }
    }
    
    @objc func imageDraw(){
        width = view.frame.size.width
        
        height = view.frame.size.height
        
        imageWidth = kennyImage.frame.size.width
        
        imageHeight = kennyImage.frame.size.height
        
        kennyImage.frame = CGRect(x: Double.random(in: width*0.05..<(width*0.95 - imageWidth)) , y: Double.random(in: height * 0.25..<(height*0.75 - imageHeight)), width: imageWidth, height: imageHeight)
    }
    
    @objc func tappedOnImage(){
        score += 1
        
        scoreLable.text = "Score: \(score)"
        kennyImage.isUserInteractionEnabled = false
    }
    
    
    @IBAction func restartButton(_ sender: Any) {
        
        timer.invalidate()
        speedTimer.invalidate()
        
        self.counter = 30
        self.score = 0
        
        self.scoreLable.text = "Score: \(self.score)"
        self.timeLable.text = "Time: \(counter)"
        kennyImage.isUserInteractionEnabled = false
        
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
    }
    
    func MakeAlert(){
        let alert = UIAlertController(title: "Game Finish!", message: "Game over. Let's try again!", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Exit", style: UIAlertAction.Style.default){
            UIAlertAction in
            if self.highscore < self.score{
                self.highscore = self.score
                UserDefaults.standard.set(self.score, forKey: "Highscore")
                self.highscoreLable.text = "Highscore: \(self.highscore)"
            }
            self.kennyImage.frame = CGRect(x: self.width*0.05, y: self.height * 0.25, width: self.imageWidth, height: self.imageHeight)
            self.counter = 30
            self.timeLable.text = "Time: \(self.counter)"
            self.score = 0
            self.scoreLable.text = "Score: \(self.score)"
        }
        let againButton = UIAlertAction(title: "Again", style: UIAlertAction.Style.default) { UIAlertAction in
            
            self.counter = 30
            self.score = 0
            
            self.scoreLable.text = "Score: \(self.score)"
            
            if self.highscore < self.score{
                self.highscore = self.score
                UserDefaults.standard.set(self.score, forKey: "Highscore")
                self.highscoreLable.text = "Highscore: \(self.highscore)"
            }
            
            self.startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.startCounter), userInfo: nil, repeats: true)
            
        }
        alert.addAction(okButton)
        alert.addAction(againButton)
        self.present(alert, animated: true)
    }
}

