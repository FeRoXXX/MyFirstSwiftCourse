//
//  Musicians.swift
//  MusicianClass
//
//  Created by Александр Федоткин on 12.10.2023.
//

import Foundation

enum MusiciansType{
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violenist
}
class Musicians {
    var name: String
    var age: Int
    var instrument: String
    var type: MusiciansType
    
//    var name = ""
//    var age = 0
//    var instrument = ""
    
//    var name: String = ""
//    var age: Int = 0
//    var instrument: String = ""
    
    init(name: String, age: Int, instrument: String, type: MusiciansType) {
        self.name = name
        self.age = age
        self.instrument = instrument
        self.type = type
    }
    
//    init() {
//        print("Musician created")
//    }
    
    func sing(){
        print("nothing else matters")
    }
}
