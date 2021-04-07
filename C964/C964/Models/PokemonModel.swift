//
//  EveryPokemon.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 1/12/21.
//

import Foundation

class PokemonModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    
    
    init(){ //Fills in pokemon[] from "pokemon.csv"
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!

            do {
                let csv = try CSV(contentsOfURL: path) //Declare path of CSV
                let rows = csv.rows //Declare rows
                
                for row in rows { //For each row in rows
                    func getResistance() -> [Double]{
                        var against = [Double]()
                        for i in 0..<resist_types.count {
                            against.append(Double(row["\(resist_types[i]!)"]!)!)
                            
                        }
                        return against
                    } //Setup for against types
                    
                    let name = row["name"]! //Get the name column in our current row
                    let id = row["pokedex_number"]! //Get the pokedex_number for our current row
                    let type1 = row["type1"]! //Etc
                    let type2 = row["type2"]!
                    
                    let malePercentage = Double(row["percentage_male"]!) ?? (-1)
                    
                    let capture = Int(row["capture_rate"]!)!
                    let happiness = Int(row["base_happiness"]!)!
                    let against = getResistance()
                    let hp = Int(row["hp"]!)!
                    let attack = Int(row["attack"]!)!
                    let defense = Int(row["defense"]!)!
                    let speed = Int(row["speed"]!)!
                    let legendary = Int(row["is_legendary"]!)!
                    //Now we setup our pokemon class object with the parsed data
                    let pokemon = Pokemon(name: name, id: id, type1: type1, type2: type2, malePercentage: malePercentage, capture: capture, happiness: happiness, against: against, hp: hp, attack: attack, defense: defense, speed: speed, is_legendary: legendary)
                    self.pokemon.append(pokemon) //Add the created pokemon to our list of all Pokemon
                }
            } catch let err as NSError {print(err.localizedDescription)}
        
    } //Setup for pokemon[]
    
    //Takes user results and filters out unwanted pokemon from pokemon[]
    public func getResults(results: Results_Data) -> Pokemon {
        
        //Sort answers to questions by weight
        results.answers.sort(by: {
            $0.answer_weight > $1.answer_weight
        })
        
        for i in 0..<results.total_questions { //Go through each sorted question now
            if pokemon.count > 1 {
                switch results.answers[i].question_id {
                case 0:
                    damageType(answerID: results.answers[i].answer_id)
                case 1:
                    resistanceType(answerID: results.answers[i].answer_id)
                case 2:
                    catchRate(answerID: results.answers[i].answer_id)
                case 3:
                    happinessLevel(answerID: results.answers[i].answer_id)
                case 4:
                    genderQuestion(answerID: results.answers[i].answer_id, weight: results.answers[i].answer_weight)
                case 5:
                    attributeType(answerID: results.answers[i].answer_id)
                default:
                    print("Error for question[\(i)]")
                }
            }
        } //End for loop
        return pokemon[0] //Returns top pick for user
    }
    
    public func getByType(typeID: Int) -> [Pokemon]{
        var pokemonTypes = [Pokemon]()
        for item in pokemon {
            if item.type1 == type[typeID]!.lowercased() {
                pokemonTypes.append(item)
            }
        }
        return pokemonTypes
        
    }
    
    //COMPLETE
    func catchRate(answerID: Int){
        var temp = [Pokemon](pokemon)

        if answerID == 0 {        //0 == Easy Catch
            temp.removeAll(where: {
                $0.capture_rate < 255/2
            })
            if temp.count > 0 {
                pokemon.removeAll(where: {
                    $0.capture_rate < 255/2
                })
            }
        }
        else if answerID == 1 {        //1 == Hard Catch
            temp.removeAll(where: {
                $0.capture_rate >= 255/2
            })
            if temp.count > 0 {
                pokemon.removeAll(where: {
                    $0.capture_rate >= 255/2
                })
            }
        }
    }
    
    func genderQuestion(answerID: Int, weight: Int){
        var temp = [Pokemon](pokemon)
        if weight < 5 {
            return
        }

        if answerID == 0 {        //0 == Male
            temp.removeAll(where: {
                $0.malePercentage < 51
            })
            if temp.count > 0 {
                pokemon.removeAll(where: {
                    $0.malePercentage < 51
                })
            }
        }
        else if answerID == 1 {        //1 == Female
            temp.removeAll(where: {
                $0.malePercentage > 40 || $0.malePercentage < 0
            })
            if temp.count > 0 {
                pokemon.removeAll(where: {
                    $0.malePercentage > 40 || $0.malePercentage < 0
                })
            }
        }
        else if answerID == 2 {        //2 == Genderless
            temp.removeAll(where: {
                $0.malePercentage >= 0
            })
            if temp.count > 0 {
                pokemon.removeAll(where: {
                    $0.malePercentage >= 0
                })
            }
        }
    }
    
    func damageType(answerID: Int){
        var temp = [Pokemon](pokemon)
        temp.removeAll(where: {
            $0.type1 != answer1[answerID].lowercased()
        })
        if temp.count > 0 {
            pokemon.removeAll(where: {
                $0.type1 != answer1[answerID].lowercased()
            })
        }
    }
    
    func resistanceType(answerID: Int){     //answerID goes from 0 - 17

        var temp = [Pokemon](pokemon)
        temp.removeAll(where: {
            $0.against[answerID] > 0.5 //Remove all pokemon who dont have resistance to our selected element
        })
        if temp.count > 0 {
            pokemon.removeAll(where: {
                $0.against[answerID] > 0.5
            })
        }
    }
    
    func attributeType(answerID: Int){
        if answerID == 0 {         //0 == Health
            pokemon.sort(by: {
                $0.hp > $1.hp
            })
        }
        else if answerID == 1 {        //1 == Attack
            pokemon.sort(by: {
                $0.attack > $1.attack
            })
            
        }
        else if answerID == 2 {        //2 == Defense
            pokemon.sort(by: {
                $0.defense > $1.defense
            })
        }
        else if answerID == 3 {        //3 == Speed
            pokemon.sort(by: {
                $0.speed > $1.speed
            })
        }
        var temp = [Pokemon](pokemon)
        temp.removeSubrange(temp.count/2..<temp.count)
        if temp.count > 0 {
            pokemon.removeSubrange(pokemon.count/2..<pokemon.count)
        }
    }
    
    func happinessLevel(answerID: Int){
        if answerID == 0 {//0 == "The most it can"
            pokemon.sort(by: {
                $0.base_happiness > $1.base_happiness
            })
        }
        else if answerID == 1 { //1 == "The least it can"
            pokemon.sort(by: {
                $0.base_happiness < $1.base_happiness
            })
        }
        else if answerID == 2 { //2 == "Dont care"

        }
        pokemon.removeSubrange(pokemon.count/2..<pokemon.count)
    }
}

//Used for init()
let resist_types = [
    0: "against_bug",
    1: "against_dark",
    2: "against_dragon",
    3: "against_electric",
    4: "against_fairy",
    5: "against_fight",
    6: "against_fire",
    7: "against_flying",
    8: "against_ghost",
    9: "against_grass",
    10: "against_ground",
    11: "against_ice",
    12: "against_normal",
    13: "against_poison",
    14: "against_psychic",
    15: "against_rock",
    16: "against_steel",
    17: "against_water",
]

let types = [
    0: "Bug",
    1: "Dark",
    2: "Dragon",
    3: "Electric",
    4: "Fairy",
    5: "Fighting",
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
