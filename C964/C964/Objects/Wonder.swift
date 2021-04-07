//
//  Wonder.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 1/19/21.
//

import Foundation

class Wonder {
    var name: String = "-"
    var gender: String = "-"
    var type1: String = "-"
    var type2: String = "-"
    var nature: String = "-"
    
    init(name: String, gender: String, type1: String, type2: String, nature: String){
        self.name = name
        self.gender = gender
        self.type1 = type1
        self.type2 = type2
        self.nature = nature
    }
}
