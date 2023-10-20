//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Александр Федоткин on 11.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
      
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    var dataArrayRecived = [String]()
    
    var indexSave: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("NarutoShippuden")
        landmarkNames.append("AttackOnTitan")
        landmarkNames.append("DeathNote")
        landmarkNames.append("OnePunchMan")
        landmarkNames.append("SoloLeveling")
        
        landmarkImages.append(UIImage(named: "NarutoShippuden")!)
        landmarkImages.append(UIImage(named: "AttackOnTitan")!)
        landmarkImages.append(UIImage(named: "DeathNote")!)
        landmarkImages.append(UIImage(named: "OnePunchMan")!)
        landmarkImages.append(UIImage(named: "SoloLeveling")!)
        
        dataArrayRecived = Array(repeating: "", count: landmarkNames.count)
        dataArrayRecived = UserDefaults.standard.object(forKey: "noteArray") as! [String]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "newData"), object: nil)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test"
        var content =  cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        content.secondaryText = ""
//        UserDefaults.standard.object(forKey: "noteArray")
        if dataArrayRecived[indexPath.row] != ""{
            content.secondaryText = dataArrayRecived[indexPath.row]
        }
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        indexSave = indexPath.row
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            destinationVC.arraySize = landmarkNames.count
            destinationVC.index = indexSave
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    @IBAction func addNote(_ sender: Any) {
//        landmarkNames.append("")
//        dataArray.append("")
//        dataArrayRecived = UserDefaults.standard.object(forKey: "noteArray") as! [String]
//        dataArrayRecived.append("")
//
//        UserDefaults.standard.set(dataArrayRecived, forKey: "noteArray")
//        tableView.reloadData()
    }
    
    @objc func reloadData(){
        dataArrayRecived = UserDefaults.standard.object(forKey: "noteArray") as! [String]
    }
}

 
