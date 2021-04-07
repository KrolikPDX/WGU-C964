//
//  Answers.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 1/23/21.
//

import Foundation

class Answers {
    var answer_id: Int = -1
    var answer_weight: Int = -1
    var answer_string: String = "-"
    var question_id: Int = -1
    
    init(id: Int, weight: Int, string: String, question: Int){
        self.answer_id = id
        self.answer_weight = weight
        self.answer_string = string
        self.question_id = question
    }
}
