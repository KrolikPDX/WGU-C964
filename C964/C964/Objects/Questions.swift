//
//  Questions.swift
//  C964
//
//  Created by Joseph Demyanovskiy on 1/23/21.
//

import Foundation

class Questions {
    var question: String = "-"
    var answers: [String] = [""]

    init(q: String, a: [String]){
        self.question = q
        self.answers = a
    }
}
