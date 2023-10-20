//
//  simpsonsCharacter.swift
//  SimpsonBook
//
//  Created by Александр Федоткин on 12.10.2023.
//

import Foundation
import UIKit

class SimpsonsCharacter {
    var characterName: String
    var characterJob: String
    var characterImage: UIImage
    init(characterName: String, characterJob: String, characterImage: UIImage) {
        self.characterName = characterName
        self.characterJob = characterJob
        self.characterImage = characterImage
    }
}
