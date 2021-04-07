//
//  AnswersModel.swift
//  C
//
//  Created by Joseph Demyanovskiy on  /  /  .
//

import Foundation
import SwiftUI

class AnswersModel:  ObservableObject {
    @Published var questions = [Questions]() //Contains question and [answers]
    
    func setup() {
        for i in  0..<question.count {
            questions.append(Questions(q: question[i], a: answer[i]))
        }
    }
}


let question = [
    "What is your favorite damage type?", //i.e. Fight, Normal, Flight
    "What resistance type do you prefer?", //i.e. Fight, Normal, Flight
    "Do you like an easy or hard catch?", //Easy | Hard
    "What level of happiness do you want your pokemon to possess?", //High | Medium | Low
    "What gender do you wish your pokemon to be?", //Male | Female | Genderless
    "What is most important for you in a pokemon?", //Attack | Health | Speed | Defense
]

let answer = [answer0, answer1, answer2, answer3, answer4, answer5]

//Damage type
let answer0  = [
    "Bug",
    "Dark",
    "Dragon",
    "Electric",
    "Fairy",
    "Fight",
    "Fire",
    "Flying",
    "Ghost",
    "Grass",
    "Ground",
    "Ice",
    "Normal",
    "Poison",
    "Psychic",
    "Rock",
    "Steel",
    "Water",
]

//Resistance type
let answer1  = [
    "Bug",
    "Dark",
    "Dragon",
    "Electric",
    "Fairy",
    "Fight",
    "Fire",
    "Flying",
    "Ghost",
    "Grass",
    "Ground",
    "Ice",
    "Normal",
    "Poison",
    "Psychic",
    "Rock",
    "Steel",
    "Water",
]

//Catch difficulty
let answer2  = [
    "Easy Catch",
    "Hard Catch"
]

//Happiness level
let answer3  = [
    "The most it can",
    "The least it can",
    "Dont care",
]

//Gender
let answer4  = [
   "Male",
   "Female",
   "Genderless"
]

//Attribute
let answer5  = [
   "Health",
   "Attack",
   "Defense",
   "Speed"
]



