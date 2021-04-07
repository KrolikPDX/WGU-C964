//
//  ContentView.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 1/10/21.
//

import SwiftUI

public struct StartingView: View {
    
    @State var progressValue: Float = 0.0
    @State var allAnswered = false
    
    @EnvironmentObject var results: Results_Data //What holds the results the user selects
    @ObservedObject var pokemonModel: PokemonModel = PokemonModel() //Model with all pokemon
    @ObservedObject var answerModel: AnswersModel = AnswersModel() //Model which contains all questions and available answers to choose from

    public var body: some View {
        NavigationView{
            VStack{
                Text("Please answer the questions below:")
                    .font(.title2)
                Divider().frame(width: 100)
                List {
                    ForEach(answerModel.questions.indices, id:\.self ){ i in //Go through total questions
                        NavigationLink(destination: Question_View(previousAnswer: i, answerModel: self.answerModel)){
                            Text("Question \(i+1):")
                            if results.answers[i].answer_id > -1{ //If we have an answer
                                //Sort by questionID
                                Text("\(results.answers[i].answer_string)").onAppear(perform: {
                                    results.answers.sort(by: {
                                        $0.question_id < $1.question_id && $0.question_id >= 0
                                    })
                                })
                            }
                        } //Nav Link
                    }
                } //End list
                .listStyle(PlainListStyle()) //Make list fit the screen instead of hover
                .onAppear(perform: {checkAnswers()}) //Check to see if all questions were answered
                Text("Tips:").bold()
                List{
                    Text("Each question has a weight option to it")
                    Text("Higher question weights take priority when choosing a pokemon").multilineTextAlignment(.center)
                }.listStyle(PlainListStyle()).frame(height: 100)
                Spacer(minLength: 15)
                HStack(spacing: 50){
                    VStack(spacing: 15){
                        NavigationLink(
                            destination: AllPokemonView(pokemonModel: pokemonModel),
                            label: {
                                Text("See all pokemon")
                            }) //End Nav Link
                        NavigationLink(
                            destination: GraphView(),
                            label: {
                                Text("View amount by type")
                            }) //End Nav Link
                        NavigationLink(
                            destination: TypeView(pokemonModel: pokemonModel),
                            label: {
                                Text("View Pokemon by type")
                            }) //End Nav Link
                        
                    }//End HStack
                    if allAnswered {
                        NavigationLink(destination: ResultsView(answerModel: answerModel),
                                       label: {
                                        Text("View Results")
                                            .font(.headline)
                                            .frame(width: 150, alignment: .center)
                                       })
                    } //End allAnswered
                } //End HStack
                Spacer(minLength: 30)
            }//End Vstack
            .toolbar {
                ToolbarItem (placement: .status){
                    VStack{
                        ProgressBar(value: $progressValue)
                            .padding(.top, 25)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Welcome")
                        .font(.largeTitle)
                        .bold()
                }
            } //TooBar
        }//End nav
        .onAppear(perform: {
            answerModel.setup()
            results.total_questions = answerModel.questions.count
        })

    } //End body
    
    
    func checkAnswers(){
        var totalAnswered = 0
        
        for i in 0..<results.total_questions { //Go through every question
            if results.answers[i].answer_id > -1 { //If our current answer id == -1 that means its not used yet
                totalAnswered += 1
                self.progressValue = Float(totalAnswered) / Float(results.total_questions)
            }
        } //End for loop
        if totalAnswered == results.total_questions{
            self.allAnswered = true
        }
    } //End checkAnswers()
} //End view

//Custom ProgressBar
struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }.frame(width: 300, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

//Print function
extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

struct StartingView_Previews: PreviewProvider {

    static var previews: some View {
        StartingView().environmentObject(Results_Data())
    }
}



