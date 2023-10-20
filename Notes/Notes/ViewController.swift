//
//  ViewController.swift
//  Notes
//
//  Created by Александр Федоткин on 17.10.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var bottomTitleText: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var idArray = [UUID]()
    var noteArray = [String]()
    
    var selectedNote = ""
    var selectedNoteId: UUID?
    var selectedSecondNote = ""
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "newData"), object: nil)
        idArray.removeAll()
        nameArray.removeAll()
        noteArray.removeAll()
        getData()
    }
    
    @objc func addButtonClicked(){
        selectedNote = ""
        performSegue(withIdentifier: "toNoteDetails", sender: nil)
    }
    
    @objc func getData(){
        idArray.removeAll()
        nameArray.removeAll()
        noteArray.removeAll()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequests = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        fetchRequests.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(fetchRequests)
            if results.count > 0{
                for result in results as! [NSManagedObject] {
                    if let title = result.value(forKey: "title") as? String{
                        self.nameArray.insert(title, at: 0)
                    } else{
                        self.nameArray.insert("", at: 0)
                    }
                    if let id = result.value(forKey: "id") as? UUID{
                        self.idArray.insert(id, at: 0)
                    }
                    if let note = result.value(forKey: "note") as? String{
                        self.noteArray.insert(note, at: 0)
                    }
                    self.tableView.reloadData()
                }
            }
            switch nameArray.count{
            case 0:
                bottomTitleText.text = "Нет заметок"
            case 1:
                bottomTitleText.text = "\(nameArray.count) заметка"
            case 2..<5:
                bottomTitleText.text = "\(nameArray.count) заметки"
            default:
                bottomTitleText.text = "\(nameArray.count) заметок"
            }
            self.tableView.reloadData()
        } catch {
            print("error")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var cellStyle = cell.defaultContentConfiguration()
//        cell.textLabel?.lineBreakMode = .byTruncatingTail
        cellStyle.textProperties.numberOfLines = 1
        cellStyle.textProperties.lineBreakMode = .byTruncatingTail
        cellStyle.secondaryTextProperties.numberOfLines = 1
        cellStyle.secondaryTextProperties.lineBreakMode = .byTruncatingTail
        if noteArray[indexPath.row] != "" && nameArray[indexPath.row] != ""{
            cellStyle.text = nameArray[indexPath.row]
            cellStyle.secondaryText = noteArray[indexPath.row]
        } else if noteArray[indexPath.row] != "" && nameArray[indexPath.row] == ""{
            cellStyle.text = noteArray[indexPath.row]
            cellStyle.secondaryText = "Нет дополнительного текста"
        } else if noteArray[indexPath.row] == "" && nameArray[indexPath.row] != ""{
            cellStyle.text = nameArray[indexPath.row]
            cellStyle.secondaryText = "Нет дополнительного текста"
        }
        cell.contentConfiguration = cellStyle
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20.00
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            let idString = idArray[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        if let id = result.value(forKey: "id") as? UUID{
                            if id == idArray[indexPath.row] {
                                context.delete(result)
                                nameArray.remove(at: indexPath.row)
                                idArray.remove(at: indexPath.row)
                                self.tableView.reloadData()
                            }
                            do{
                                try context.save()
                            } catch{
                                print("error")
                            }
                            break
                        }
                    }
                }
            }
            catch{
                print("error")
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNote = nameArray[indexPath.row]
        selectedNoteId = idArray[indexPath.row]
        selectedSecondNote = noteArray[indexPath.row]
        performSegue(withIdentifier: "toNoteDetails", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNoteDetails"{
            let destinationVC = segue.destination as! NoteDetailsViewController
            destinationVC.selectedNote = selectedNote
            destinationVC.selectedId = selectedNoteId
            destinationVC.selectedSecondNote = selectedSecondNote
            selectedNote = ""
            selectedSecondNote = ""
        }
    }

}

