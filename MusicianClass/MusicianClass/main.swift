//
//  main.swift
//  MusicianClass
//
//  Created by Александр Федоткин on 12.10.2023.
//

import Foundation

let James = Musicians(name: "James Hetfield", age: 50, instrument: "Guitar", type: .Vocalist)
//James.age = 50
//James.name = "James Hetfield"
//James.instrument = "Guitar"
James.sing()
let kirk = SuperMusician(name: "Kirk", age: 55, instrument: "Guitar", type: .LeadGuitar)
kirk.sing()
print(James.age)

