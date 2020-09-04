//
//  ViewController.swift
//  Quiz App IOS
//
//  Created by EAPPLE on 04/09/2020.
//  Copyright © 2020 Abdullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizLogic = QuizLogic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let result = quizLogic.checkAnswers(userAnswer)
        
        if result{
            sender.backgroundColor = UIColor.green
        }
        else{
           sender.backgroundColor = UIColor.red
        }
        
        quizLogic.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizLogic.getQuizQuestions()
        progressBar.progress = quizLogic.getProgrss()
        scoreLabel.text = "Score: \(quizLogic.getScore())"
        btnTrue.backgroundColor = UIColor.clear
        btnFalse.backgroundColor = UIColor.clear
    }
    
}

