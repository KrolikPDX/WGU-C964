//
//  PokemonView.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 1/27/21.
//

import Foundation
import SwiftUI

public struct PokemonView: View {
    let showPokemon: Pokemon
    
    public var body: some View {
        VStack{
            Text("\(showPokemon.name)")
                .font(.title)
                .bold()
            //Divider()
            List{
                Text("HP: ").bold() + Text("\(showPokemon.hp)")
                Text("Attack: ").bold() + Text("\(showPokemon.attack)")
                Text("Defense: ").bold() + Text("\(showPokemon.defense)")
                Text("Speed: ").bold() + Text("\(showPokemon.speed)")
                Text("Damage types: ").bold()
                    + Text("\(showPokemon.type1.capitalized)  \(showPokemon.type2.capitalized)")
                Text("Resistance types: ").bold() + Text("\(showPokemon.getResistances())")
                Text("Male Percentage: ").bold() + Text("\(Int(showPokemon.malePercentage))%")
                Text("Capture Rate: ").bold() + Text("\(showPokemon.getCaptureRate())%") //576 old value
                Text("Base happiness level: ").bold() + Text("\(showPokemon.base_happiness)")
                Text("Legendary: ").bold() + Text("\(showPokemon.is_legendary.boolValue)")

            }//ENd list

            Image("\(showPokemon.id)")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150, alignment: .center)
            //Spacer(minLength: 10)
            //Start over button
        }

        
    }
}


extension Int {
    var boolValue: String  {
        if self == 1 {
            return "True"
        } else {
            return "False"
        }
    }
}

struct PokemonView_Previews: PreviewProvider {

    static var previews: some View {
        PokemonView(showPokemon: Pokemon(name: "Bulbasaur", id: "1", type1: "gas", type2: "fart", malePercentage: 45, capture: 200, happiness: 90, against: [0, 0], hp: 100, attack: 20, defense: 50, speed: 15, is_legendary: 0))
    }
}
