//
//  Pokemon.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 1/12/21.
//

import Foundation
import SwiftUI

class Pokemon {
    var name: String            //The English name of the Pokemon
    var id: String              //The entry number of the Pokemon in the National Pokedex
    var type1: String           //The Primary Type of the Pokemon
    var type2: String           //The Secondary Type of the Pokemon
    var malePercentage: Double  //The percentage of the species that are male. Blank if the Pokemon is genderless.
    var capture_rate: Int       //Capture Rate of the Pokemon from 3-255 where 255/255 = 100% capture rate
    var base_happiness: Int     //Base Happiness of the Pokemon from 0-140
    var against: [Double]       /*
                                Eighteen features that denote the amount of damage taken against an attack of a particular type
                                against[0] = 1 How much damage taken by this attack type (BUG) from .5 -> 2.0
                                */
    var hp: Int                 //The Base HP of the Pokemon
    var attack: Int             //The Base Attack of the Pokemon
    var defense: Int            //The Base Defense of the Pokemon
    var speed: Int              //The Base Speed of the Pokemon
    var is_legendary: Int       //Denotes if the Pokemon is legendary.
    
    init(name: String, id: String, type1: String, type2: String, malePercentage: Double, capture: Int, happiness: Int, against: [Double], hp: Int, attack: Int, defense: Int, speed: Int, is_legendary: Int){
        
        self.name = name
        self.id = id
        self.type1 = type1
        self.type2 = type2
        self.malePercentage = malePercentage
        self.capture_rate = capture
        self.base_happiness = happiness
        self.against = against
        self.hp = hp
        self.attack = attack
        self.defense = defense
        self.speed = speed
        self.is_legendary = is_legendary
    }
    
    func getResistances() -> String{ //Returns all resistances where index.value < .5
        var string = ""
        for i in 0..<self.against.count {
            if against[i] <= 0.5 {
                string += " \(resistance[i]!)"
            }
        }
        return string
    }
    
    func getCaptureRate() -> String{
        let captureRate = self.capture_rate
        let rate: Float = (Float(captureRate) * 1/3)/255 * 100
        let string = String(format: "%.2f", rate)
        
        return "\(string)"
    }
}

let resistance = [
    0: "Bug",
    1: "Dark",
    2: "Dragon",
    3: "Electric",
    4: "Fairy",
    5: "Fight",
    6: "Fire",
    7: "Flying",
    8: "Ghost",
    9: "Grass",
    10: "Ground",
    11: "Ice",
    12: "Normal",
    13: "Poison",
    14: "Psychic",
    15: "Rock",
    16: "Steel",
    17: "Water",
]

/* Unused data in dataset
 japanese_name: The Original Japanese name of the Pokemon
 classification: The Classification of the Pokemon as described by the Sun and Moon Pokedex i.e. Bat Pokemon
 height_m: Height of the Pokemon in metres
 weight_kg: The Weight of the Pokemon in kilograms
 baseeggsteps: The number of steps required to hatch an egg of the Pokemon
 abilities: A stringified list of abilities that the Pokemon is capable of having
 experience_growth: The Experience Growth of the Pokemon
 sp_attack: The Base Special Attack of the Pokemon
 sp_defense: The Base Special Defense of the Pokemon
 generation: The numbered generation which the Pokemon was first introduced
 */






