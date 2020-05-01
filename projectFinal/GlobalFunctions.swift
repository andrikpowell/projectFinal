//
//  globalFunctions.swift
//  projectFinal
//
//  Created by Andrik on 4/29/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import Foundation
import UIKit

/* FADE OPACITY CODE */
func setView(view: UIView, hidden: Bool) {
    UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
        view.isHidden = hidden
    })
}

/* SCORE FUNCTION */

func didScore(points:Int){
    global.score = global.score + points
    TimerViewController().scoreLabel.text = "\(global.score)"
   }

func wrongAnswer() {
    setView(view: MessageViewController().questionWrongLabel, hidden: false)
    Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
        setView(view: MessageViewController().questionWrongLabel, hidden: true)
    }
}
func correctAnswer() {
    setView(view: MessageViewController().questionGoodJobLabel, hidden: false)
    Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
        setView(view: MessageViewController().questionGoodJobLabel, hidden: true)

    }
}

func nextQuestion() {
    if(global.questionNumber == 1) {
        Q1ViewController().performSegue(withIdentifier: "Q2Segue", sender: Q1ViewController())
    }
    else if(global.questionNumber == 2) {
        Q2ViewController().performSegue(withIdentifier: "Q3Segue", sender: Q2ViewController())
    }
    else if(global.questionNumber == 3) {
        Q3ViewController().performSegue(withIdentifier: "Q4Segue", sender: Q3ViewController())

    }
    else if(global.questionNumber == 4) {
        Q4ViewController().performSegue(withIdentifier: "Q5Segue", sender: Q4ViewController())
    }
    else if(global.questionNumber == 5){
        global.questionNumber = 1
        Q5ViewController().performSegue(withIdentifier: "Q1Segue", sender: Q5ViewController())
    }
    else {
        HomeViewController().performSegue(withIdentifier: "Q1Segue", sender: HomeViewController())
    }
}

func questionClear() {
    //q1nature1Button.isSelected = false
    //q1nature2Button.isSelected = false
    //q1nature3Button.isSelected = false
    //q1nature4Button.isSelected = false
    //q2blueButton.backgroundColor = UIColor.systemBlue
    //q2greenButton.backgroundColor = UIColor.systemGreen
    //q2purpleButton.backgroundColor = UIColor.systemPurple
    //q2redButton.backgroundColor = UIColor.systemRed
    //q4textField.text = ""
    //chars = 0
    //nature1 = false
    //nature2 = false
    //nature3 = false
    //nature4 = false
    //q2Slider.setValue(2, animated: false)
    //sliderAnswer = 2
    //descriptionLabel.text = ""
    //welcomeLabel.text = ""
    global.questionLabelNumber += 1
    //welcomeLabel.text = "Question \(global.questionLabelNumber)"
}

func questionScreen() {
    TimerViewController().timerReset()
    global.score = 0
    global.questionLabelNumber = 0
    global.questionNumber = 0
    global.areQuestionsDone = false
    TimerViewController().scoreLabel.text = "\(global.score)"
    TimerViewController().TimerLabel.text = TimerViewController().timeString(time: TimeInterval(global.timerSeconds))  //This will update the label.
    if global.isTimerRunning == false {
        TimerViewController().runTimer()
    }
    nextQuestion()
}
