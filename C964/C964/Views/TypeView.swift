//
//  ViewType.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 2/4/21.
//

import SwiftUI

public struct TypeView: View {
    let pokemonModel: PokemonModel
    @State var selectedPokemon = [Pokemon]()
    @State var selectedType: Int = 0
    public var body: some View {
        VStack{
            Text("Please select a type to view \npokemon of that type").font(.title3).multilineTextAlignment(.center)
            Menu {
                ForEach(0..<type.count){ i in
                    Button {
                        selectedType = i
                        selectedPokemon = pokemonModel.getByType(typeID: selectedType)
                    } label: {
                        Text("\(type[i]!)")
                    }
                }

            } label: {
                Text("\(type[selectedType]!)").font(.title3)
                Image(systemName: "arrow.down")
            }
            ScrollViewReader{ proxy in
                List{
                    ForEach(selectedPokemon.indices, id:\.self ){ i in
                        HStack{
                            Text("\(i+1):  \(selectedPokemon[i].name)    ")
                            Image("\(selectedPokemon[i].id)")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .leading)
                                .aspectRatio(contentMode: .fit)
                        }
                    }.onChange(of: selectedType, perform: { value in
                        proxy.scrollTo(0, anchor: .top)
                    })
                } //End List
            }
            
            

        }

    }
}

struct TypeView_Preview: PreviewProvider {

    static var previews: some View {
        TypeView(pokemonModel: PokemonModel())

    }
}

let type = [
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
