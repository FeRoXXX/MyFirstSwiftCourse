//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Александр Федоткин on 12.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [SimpsonsCharacter]()
    var saveIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        let hommer = SimpsonsCharacter(characterName: "Homer", characterJob: "Nuclear Safety", characterImage: UIImage(named: "homer")!)
        
        let marge = SimpsonsCharacter(characterName: "Marge", characterJob: "Housewife", characterImage: UIImage(named: "marge")!)

        let bart = SimpsonsCharacter(characterName: "Bart", characterJob: "Student", characterImage: UIImage(named: "bart")!)

        let lisa = SimpsonsCharacter(characterName: "Lisa", characterJob: "Student", characterImage: UIImage(named: "lisa")!)
        
        let maggie = SimpsonsCharacter(characterName: "Maggie", characterJob: "Baby", characterImage: UIImage(named: "maggie")!)

        let homerArray = [hommer, marge, bart, lisa, maggie]
        mySimpsons = homerArray
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = mySimpsons[indexPath.row].characterName
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        saveIndex = indexPath.row
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpson = mySimpsons[saveIndex]
        }
    }

}

