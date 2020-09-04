//
//  QuizLogic.swift
//  Quiz App IOS
//
//  Created by EAPPLE on 04/09/2020.
//  Copyright © 2020 Abdullah. All rights reserved.
//

import Foundation

struct QuizLogic {
    
    var questionNumber = 0
    var score = 0
    
    var quizQuestions = [
        Question(q: "4 + 2 is equal to 6.", a: "True"),
        Question(q: "5 - 3 is greater than 1." , a: "True"),
         Question(q: "2 + 2 / 2 is equal to 2." , a: "False"),
        Question(q: "10 / 2 is equal to 5." , a: "True"),
        Question(q: "2 + 2 -2 is greater than 1." , a: "True"),
        Question(q: "3 + 8 is greater than 5." , a:"False")
    ]
    
    mutating func checkAnswers(_ userAnswer:String) -> Bool{
        
     if userAnswer == quizQuestions[questionNumber].answer{
        score += 1
        return true
     }
     else{
       return false
     }
    }
    
    
    func getQuizQuestions() -> String {
        return quizQuestions[questionNumber].questions
    }
    
    func getProgrss() -> Float {
        let progress = Float(questionNumber) / Float(quizQuestions.count)
        return progress
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
       if questionNumber + 1 < quizQuestions.count{
         questionNumber += 1
        }
        else{
            questionNumber = 0
            score = 0
        }
    }
}
