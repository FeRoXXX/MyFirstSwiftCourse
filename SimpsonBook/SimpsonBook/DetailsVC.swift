 //
//  DetailsVC.swift
//  SimpsonBook
//
//  Created by Александр Федоткин on 12.10.2023.
//

import UIKit


class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var jobLable: UILabel!
    
    var selectedSimpson: SimpsonsCharacter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectedSimpson?.characterImage
        nameLable.text = selectedSimpson?.characterName
        jobLable.text = selectedSimpson?.characterJob
    }
    

}
