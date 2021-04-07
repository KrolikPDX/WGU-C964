//
//  Answers.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 1/16/21.
//


import Combine
import Foundation

class Results_Data: ObservableObject {
    @Published var answers = [Answers]() //Associate weights to answers
    var total_questions = 8
    
    
    
    init(){
        for _ in 1...total_questions{
            answers.append(Answers(id: -1, weight: -1, string: "-", question: -1))
        }
    }
    
    func printAllAnswers(){
        for i in 0..<total_questions {
            print("Element[\(i)] answerID[\(answers[i].answer_id)] weight[\(answers[i].answer_weight)] qID[\(answers[i].question_id)]")
        }
    }
}


