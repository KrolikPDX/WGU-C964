//
//  QuestionViews.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 1/15/21.
//

import Foundation
import SwiftUI

struct Question_View: View {
    var previousAnswer: Int
    @ObservedObject var answerModel: AnswersModel
    @EnvironmentObject var results: Results_Data
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var weight: Float = 5.0

    var body: some View {
        Text("\(answerModel.questions[previousAnswer].question)") //Display question
        List {
            ForEach(0..<answerModel.questions[previousAnswer].answers.count) { i in //Go through all the answers in our selected question
                Button(action: {
                    results.answers[previousAnswer] = Answers(id: i, weight: Int(weight), string: answerModel.questions[previousAnswer].answers[i], question: previousAnswer)
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("\(answerModel.questions[previousAnswer].answers[i])")//Display all the answers
                })
            }
        }
        
        Text("Question weight: \(Int(weight))")
        Slider(value: $weight, in: 0...10, step: 1)
            .frame(width: UIScreen.screenWidth * 0.75)
    }//End body
    

    

}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


