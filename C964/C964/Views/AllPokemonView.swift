//
//  AllPokemonView.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 2/2/21.
//

import SwiftUI

public struct AllPokemonView: View {
    @State var pokemonSelector: Float = 0.0
    @ObservedObject var pokemonModel: PokemonModel
    @State var currentPokemon = Pokemon(name: "Test", id: "", type1: "", type2: "", malePercentage: 50, capture: 0, happiness: 0, against: [0,1], hp: 0, attack: 0, defense: 0, speed: 0, is_legendary: 0)
    

    public var body: some View {
        ZStack {
            VStack{
                Text("\(pokemonModel.pokemon[Int(pokemonSelector)].name)")
                    .font(.largeTitle)
                Divider().frame(width: 100, height: 50)
                HStack(spacing: 25){
                    Image("\(pokemonModel.pokemon[Int(pokemonSelector)].id)")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    VStack(alignment: .leading, spacing: 15){
                        Text("Pokedex: \(currentPokemon.id)")
                        Text("Base Health: \(currentPokemon.hp)")
                        Text("Base Attack: \(currentPokemon.attack)")
                        Text("Base Defense: \(currentPokemon.defense)")
                        Text("Base Speed: \(currentPokemon.speed)")
                        Text("Damage Type:\n\(currentPokemon.type1.capitalized) \(currentPokemon.type2.capitalized)")
                        Text("Capture Percentage: \n\(currentPokemon.getCaptureRate())%")
                    }
                }//End HStack

                Slider(value: $pokemonSelector, in: 0...720, step: 1)
                    .frame(width: UIScreen.screenWidth * 0.75, height: 35)
                    .onChange(of: pokemonSelector, perform: { newValue in
                        currentPokemon = pokemonModel.pokemon[Int(pokemonSelector)]
                    })
                    .onAppear(perform: {
                        currentPokemon = pokemonModel.pokemon[Int(pokemonSelector)]
                    })
                
                Divider().frame(width: 100, height: 50)
                Text("Hint")
                Text("Capture % is the chance of catching the Pokemon at full health with a standard Poke Ball")
                Spacer()
            }

        }
    }
}


struct AllPokemonView_Preview: PreviewProvider {
    static var previews: some View {
        AllPokemonView(pokemonModel: PokemonModel())
    }
}
