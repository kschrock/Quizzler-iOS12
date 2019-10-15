//
//  Question.swift
//  Quizzler
//
//  Created by Kordell Schrock on 5/11/19.
// 
//

import Foundation

class Question {
    
    let questionText:String
    let answer:Bool
    
    init(text: String, correctAnswer:Bool) {
        
        questionText = text
        answer = correctAnswer
    }
}
