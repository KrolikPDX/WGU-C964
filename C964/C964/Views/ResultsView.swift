//
//  Results_View.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 1/18/21.
//

import Foundation
import SwiftUI

public struct ResultsView: View {
    @EnvironmentObject var results: Results_Data
    @ObservedObject var allPokemon: PokemonModel = PokemonModel()
    @ObservedObject var answerModel: AnswersModel
    @State var pokemon: Double = 0
    @State var showPokemon: Pokemon = Pokemon(name: "", id: "", type1: "", type2: "", malePercentage: 0, capture: 0, happiness: 0, against: [0, 1], hp: 0, attack: 0, defense: 0, speed: 0, is_legendary: 0)

    
    public var body: some View {
        VStack{
            Text("Please review your answers:") //Add question + answer
            Divider()
            List{
                ForEach(0..<results.total_questions){ i in
                    Text("\(answerModel.questions[results.answers[i].question_id].question)\n").bold() + Text("\(results.answers[i].answer_string) with weight: \(results.answers[i].answer_weight)")
                }
            }
            NavigationLink(destination: PokemonView(showPokemon: showPokemon)){
                Text("View your Pokemon!")
                
            }
            Spacer(minLength: 150)



        }//End VStack
        .onAppear(perform: {
            showPokemon = allPokemon.getResults(results: results)
        })
    }
}
//
//struct ResultsView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ResultsView(allPokemon: PokemonModel(), answerModel: AnswersModel()).environmentObject(Results_Data())
//    }
//}
