//
//  ViewController.swift
//  projectOne
//
//  Created by Powell, Andrik on 2/24/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

/* OUTLETS */
    var score:Int = 0
    var timer = Timer()
    var timerSeconds = 80 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var isTimerRunning:Bool = false //This will be used to make sure only one timer is created at a time.
    var chars:Int = 0
    var token:String = ""
    var hsToken:Int = 0
    var nature1 = false
    var nature2 = false
    var nature3 = false
    var nature4 = false
    var q3button1 = false
    var q3button2 = false
    var q3button3 = false
    var q3button4 = false
    var questionNumber = 0
    var areQuestionsDone:Bool = false
    var questionLabelNumber:Int = 0
    
/* OUTLETS */

    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameDisclaimerLabel1: UILabel!
    @IBOutlet weak var nameDisclaimerLabel2: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var anxietyLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreTextLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var q1nature1Button: UIButton!
    @IBOutlet weak var q1nature2Button: UIButton!
    @IBOutlet weak var q1nature3Button: UIButton!
    @IBOutlet weak var q1nature4Button: UIButton!
    @IBOutlet weak var q1nature1BG: UIImageView!
    @IBOutlet weak var q1nature2BG: UIImageView!
    @IBOutlet weak var q1nature3BG: UIImageView!
    @IBOutlet weak var q1nature4BG: UIImageView!
    @IBOutlet weak var questionSubmitButton: UIButton!
    @IBOutlet weak var questionWrongLabel: UILabel!
    @IBOutlet weak var questionGoodJobLabel: UILabel!
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var finalScoreNumberLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var homeScoreNumberLabel: UILabel!
    @IBOutlet weak var backHomeButton: UIButton!
    @IBOutlet weak var q2purpleButton: UIButton!
    @IBOutlet weak var q2greenButton: UIButton!
    @IBOutlet weak var q2redButton: UIButton!
    @IBOutlet weak var q2blueButton: UIButton!
    @IBOutlet weak var q4textField: UITextField!
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var MadeHighScoreLabel: UILabel!
    @IBOutlet weak var finalHighScoreNumberLabel: UILabel!
  
    /* UPON APP LOAD */
        override func viewDidLoad() {
            super.viewDidLoad()
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "playerName")
            if(token == "") || (token == nil) {
                
                introScreen()
            }
            else {
                homeScreen()
            }
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.q1nature1ImageSelect))
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.q1nature2ImageSelect))
            let tap3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.q1nature3ImageSelect))
            let tap4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.q1nature4ImageSelect))

            q1nature1BG.addGestureRecognizer(tap1)
            q1nature2BG.addGestureRecognizer(tap2)
            q1nature3BG.addGestureRecognizer(tap3)
            q1nature4BG.addGestureRecognizer(tap4)

    /* TRYING TO FIGURE OUT HOW TO DO RANDOM QUESTIONS

                   let fn1 = questionArray[0]
                   fn1(self)()
                   let fn2 = dictionaryOfFunctions["question2"]
                   fn2!(self)()
                   let fn3 = dictionaryOfFunctions["question3"]
                   fn3!(self)()
                   let fn4 = dictionaryOfFunctions["question4"]
                   fn4!(self)()
                   let fn5 = dictionaryOfFunctions["question5"]
                   fn5!(self)()

        
     */
        }
    
/* QUESTION 1 SWITCHES*/
    
    @IBAction func q1nature1Action(_ sender: UIButton) {
        if sender.isSelected {
           sender.isSelected = false
            nature1 = false
        } else {
            sender.isSelected  = true
            nature1 = true
        }
    }
    @IBAction func q1nature2Action(_ sender: UIButton) {
        if sender.isSelected {
           sender.isSelected = false
            nature2 = false
        } else {
            sender.isSelected  = true
            nature2 = true
        }
    }
    @IBAction func q1nature3Action(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
             nature3 = false
         } else {
             sender.isSelected  = true
             nature3 = true
         }
    }
    @IBAction func q1nature4Action(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
             nature4 = false
         } else {
             sender.isSelected  = true
             nature4 = true
         }
    }
    @objc func q1nature1ImageSelect()
     {
         if q1nature1Button.isSelected {
            q1nature1Button.isSelected = false
             nature1 = false
         } else {
             q1nature1Button.isSelected  = true
             nature1 = true
         }
     }
     @objc func q1nature2ImageSelect()
     {
         if q1nature2Button.isSelected {
            q1nature2Button.isSelected = false
             nature2 = false
         } else {
             q1nature2Button.isSelected  = true
             nature2 = true
         }
     }
     @objc func q1nature3ImageSelect()
     {
         if q1nature3Button.isSelected {
            q1nature3Button.isSelected = false
             nature3 = false
         } else {
             q1nature3Button.isSelected  = true
             nature3 = true
         }
     }
     @objc func q1nature4ImageSelect()
     {
         if q1nature4Button.isSelected {
            q1nature4Button.isSelected = false
             nature4 = false
         } else {
             q1nature4Button.isSelected  = true
             nature4 = true
         }
     }
    
    /* COLOR BUTTONS */
    
    @IBAction func q2purpleButtonAction(_ sender: UIButton) {
        if(questionNumber == 3) {
            wrongAnswer()
        }
        else if(questionNumber == 5) {
            wrongAnswer()
        }

    }
    @IBAction func q2greenButtonAction(_ sender: UIButton) {
        if(questionNumber == 3) {
            wrongAnswer()
        }
        else if(questionNumber == 5) {
            didScore(points:10)
            nextQuestion()
            correctAnswer()
        }
    }
    
    @IBAction func q2redButtonAction(_ sender: UIButton) {
        if(questionNumber == 3) {
            wrongAnswer()
        }
        else if(questionNumber == 5) {
            wrongAnswer()
        }

    }
    
    @IBAction func q2blueButtonAction(_ sender: UIButton) {
        if(questionNumber == 3) {
            didScore(points:10)
            nextQuestion()
            correctAnswer()
        }
        else if(questionNumber == 5) {
            wrongAnswer()
        }
    }
    
    
    
/* SCORE FUNCTION */
    
    func didScore(points:Int){
       score = score + points
        scoreLabel.text = "\(score)"
       }
    
/* FADE OPACITY CODE */

    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        })
    }

/* TIMER CODE */
    
    func timeString(time:TimeInterval) -> String {
    //let hours = Int(time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    return String(format:"%2i:%02i", minutes, seconds)
    }
    func runTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timerSeconds -= 1     //This will decrement(count down)the seconds.
        TimerLabel.text = timeString(time: TimeInterval(timerSeconds))  //This will update the label.
        if(timerSeconds == 0) {
            timer.invalidate()
            tryAgainScreen()
        }
        else if(timerSeconds <= 20) {
            self.TimerLabel.textColor = UIColor.systemRed
            //self.anxietyLabel.textColor = UIColor.systemRed
        }
}

/* SLIDER CODE */

    var sliderAnswer:Int = 2
    let step: Float = 1
    
    @IBOutlet weak var q2Slider: UISlider!
    
    @IBOutlet weak var q2SliderArrow: UIImageView!
    @IBAction func q2SliderAction(_ sender: UISlider) {
        sliderAnswer = Int(sender.value)
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
    }
    
/* BUTTON SUBMIT - DECIDES WHICH QUESTION TO DO NEXT */

    @IBAction func questionSubmit(_ sender: UIButton) {
        if(areQuestionsDone == false) {
        if(questionNumber == 1) {
            if(nature1 == true && nature2 == true && nature3 == false && nature4 == true)
            {
                didScore(points:10)
                nextQuestion()
                correctAnswer()
            }
            else
            {
                wrongAnswer()
            }
        }
        else if(questionNumber == 2) {
            if(sliderAnswer == 5)
            {
                didScore(points:10)
                nextQuestion()
                correctAnswer()

            }
            else
            {
                wrongAnswer()
            }
        }
            if(questionNumber == 4) {
                let q4word = q4textField.text!
                chars = q4word.count
                q4textField.resignFirstResponder()
                if (chars == 6) {
                    didScore(points:10)
                    nextQuestion()
                    correctAnswer()
                }
                    else {
                    wrongAnswer()
                    }

            }
        }
        else {
            tryAgainScreen()
        }
    }
    
/* QUESTIONS */
    
    @objc func question1() {
        questionClear()
        questionNumber = 1
        setView(view: q1nature1Button, hidden: false)
        setView(view: q1nature2Button, hidden: false)
        setView(view: q1nature3Button, hidden: false)
        setView(view: q1nature4Button, hidden: false)
        setView(view: q1nature1BG, hidden: false)
        setView(view: q1nature2BG, hidden: false)
        setView(view: q1nature3BG, hidden: false)
        setView(view: q1nature4BG, hidden: false)
        descriptionLabel.text = "Choose the images that reflect NATURE"
    }
    
    @objc func question2() {
        questionClear()
        questionNumber = 2
        setView(view: q2Slider, hidden: false)
        setView(view: q2SliderArrow, hidden: false)
        descriptionLabel.text = "Move the slider to where the ARROW is pointing"
    }
    
    @objc func question3() {
        questionClear()
        questionNumber = 3
        setView(view: questionSubmitButton, hidden: true)
        setView(view: q2purpleButton, hidden: false)
        setView(view: q2greenButton, hidden: false)
        setView(view: q2redButton, hidden: false)
        setView(view: q2blueButton, hidden: false)
        descriptionLabel.text = "Select the button that says BLUE"
    }
    
    @objc func question4() {
        questionClear()
        questionNumber = 4
        setView(view: q4textField, hidden: false)
        descriptionLabel.text = "Type in a 6 LETTER word:"
    }
    @objc func question5() {
        questionClear()
        questionNumber = 5
        q2blueButton.backgroundColor = UIColor.systemPurple
        q2greenButton.backgroundColor = UIColor.systemRed
        q2purpleButton.backgroundColor = UIColor.systemBlue
        q2redButton.backgroundColor = UIColor.systemGreen
        setView(view: questionSubmitButton, hidden: true)
        setView(view: q2purpleButton, hidden: false)
        setView(view: q2greenButton, hidden: false)
        setView(view: q2redButton, hidden: false)
        setView(view: q2blueButton, hidden: false)
        descriptionLabel.text = "Select the button that says GREEN"
    }


        
/* APP SCREENS */
    
    @objc func homeScreen() {
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "playerName")!
        let hsToken = defaults.integer(forKey: "highScore")
        areQuestionsDone = false
        welcomeLabel.text = "Welcome, \(String(describing: token))"
        homeScoreNumberLabel.text = "\(hsToken)"
        setView(view: nameLabel, hidden: true)
        setView(view: nameDisclaimerLabel1, hidden: true)
        setView(view: nameDisclaimerLabel2, hidden: true)
        setView(view: nameTextField, hidden: true)
        setView(view: nameButton, hidden: true)
        setView(view: nameErrorLabel, hidden: true)
        setView(view: resetButton, hidden: false)
        setView(view: playButton, hidden: false)
        setView(view: tryAgainButton, hidden: true)
        setView(view: TimerLabel, hidden: true)
        setView(view: anxietyLabel, hidden: true)
        setView(view: finalScoreLabel, hidden: true)
        setView(view: finalScoreNumberLabel, hidden: true)
        setView(view: backHomeButton, hidden: true)
        setView(view: homeScoreLabel, hidden: false)
        setView(view: homeScoreNumberLabel, hidden: false)
        setView(view: finalHighScoreNumberLabel, hidden: true)
        setView(view: MadeHighScoreLabel, hidden: true)
        timerReset()
    }
    
    @objc func introScreen() {
        welcomeLabel.text = "Welcome"
        setView(view: nameLabel, hidden: false)
        setView(view: nameErrorLabel, hidden: true)
        setView(view: nameDisclaimerLabel1, hidden: false)
        setView(view: nameDisclaimerLabel2, hidden: false)
        setView(view: nameTextField, hidden: false)
        setView(view: nameButton, hidden: false)
        setView(view: resetButton, hidden: true)
        setView(view: playButton, hidden: true)
        setView(view: tryAgainButton, hidden: true)
        setView(view: TimerLabel, hidden: true)
        setView(view: anxietyLabel, hidden: true)
        setView(view: finalScoreLabel, hidden: true)
        setView(view: finalScoreNumberLabel, hidden: true)
        setView(view: backHomeButton, hidden: true)
        setView(view: homeScoreLabel, hidden: true)
        setView(view: homeScoreNumberLabel, hidden: true)
        setView(view: finalHighScoreNumberLabel, hidden: true)
        setView(view: MadeHighScoreLabel, hidden: true)
        timerReset()
        score = 0
    }

    @objc func questionScreen() {
        timerReset()
        score = 0
        questionLabelNumber = 0
        questionNumber = 0
        areQuestionsDone = false
        scoreLabel.text = "\(score)"
        TimerLabel.text = timeString(time: TimeInterval(timerSeconds))  //This will update the label.
        if isTimerRunning == false {
            runTimer()
        }
        nextQuestion()
    }
    
    func questionClear() {
        setView(view: playButton, hidden: true)
        setView(view: questionWrongLabel, hidden: true)
        setView(view: resetButton, hidden: true)
        setView(view: TimerLabel, hidden: false)
        setView(view: anxietyLabel, hidden: false)
        setView(view: scoreLabel, hidden: false)
        setView(view: scoreTextLabel, hidden: false)
        setView(view: q1nature1Button, hidden: true)
        setView(view: q1nature2Button, hidden: true)
        setView(view: q1nature3Button, hidden: true)
        setView(view: q1nature4Button, hidden: true)
        setView(view: q1nature1BG, hidden: true)
        setView(view: q1nature2BG, hidden: true)
        setView(view: q1nature3BG, hidden: true)
        setView(view: q1nature4BG, hidden: true)
        setView(view: q2SliderArrow, hidden: true)
        setView(view: q2Slider, hidden: true)
        setView(view: q2purpleButton, hidden: true)
        setView(view: q2greenButton, hidden: true)
        setView(view: q2redButton, hidden: true)
        setView(view: q2blueButton, hidden: true)
        setView(view: questionSubmitButton, hidden: false)
        setView(view: tryAgainButton, hidden: true)
        setView(view: descriptionLabel, hidden: false)
        setView(view: finalScoreLabel, hidden: true)
        setView(view: finalScoreNumberLabel, hidden: true)
        setView(view: backHomeButton, hidden: true)
        setView(view: homeScoreLabel, hidden: true)
        setView(view: homeScoreNumberLabel, hidden: true)
        setView(view: q4textField, hidden: true)
        setView(view: finalHighScoreNumberLabel, hidden: true)
        setView(view: MadeHighScoreLabel, hidden: true)
        q1nature1Button.isSelected = false
        q1nature2Button.isSelected = false
        q1nature3Button.isSelected = false
        q1nature4Button.isSelected = false
        q2blueButton.backgroundColor = UIColor.systemBlue
        q2greenButton.backgroundColor = UIColor.systemGreen
        q2purpleButton.backgroundColor = UIColor.systemPurple
        q2redButton.backgroundColor = UIColor.systemRed
        q4textField.text = ""
        chars = 0
        nature1 = false
        nature2 = false
        nature3 = false
        nature4 = false
        q2Slider.setValue(2, animated: false)
        sliderAnswer = 2
        descriptionLabel.text = ""
        welcomeLabel.text = ""
        questionLabelNumber = questionLabelNumber + 1
        welcomeLabel.text = "Question \(questionLabelNumber)"
        
    }
    
    @objc func tryAgainScreen() {
        questionClear()
        areQuestionsDone = true
        TimerLabel.text = "1:20"
        welcomeLabel.text = "Try Again?"
        descriptionLabel.text = ""
        finalScoreNumberLabel.text = "\(score)"
        let defaults = UserDefaults.standard
        let hsToken = defaults.integer(forKey: "highScore")
        if(score > hsToken) || (hsToken == 0) {
            defaults.set(score, forKey: "highScore")
            setView(view: MadeHighScoreLabel, hidden: false)
        }
        else {
            score = 0
            finalHighScoreNumberLabel.text = "High Score: \(hsToken)"
            setView(view: finalHighScoreNumberLabel, hidden: false)
        }
        setView(view: tryAgainButton, hidden: false)
        setView(view: questionSubmitButton, hidden: true)
        setView(view: anxietyLabel, hidden: true)
        setView(view: scoreTextLabel, hidden: true)
        setView(view: scoreLabel, hidden: true)
        setView(view: TimerLabel, hidden: true)
        setView(view: questionWrongLabel, hidden: true)
        setView(view: questionGoodJobLabel, hidden: true)
        setView(view: finalScoreLabel, hidden: false)
        setView(view: finalScoreNumberLabel, hidden: false)
        setView(view: backHomeButton, hidden: false)
    }
    
    @objc func timerReset() {
        timerSeconds = 80
        TimerLabel.textColor = UIColor.black
    }
    
    @objc func wrongAnswer() {
        setView(view: questionWrongLabel, hidden: false)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
            self.setView(view: self.questionWrongLabel, hidden: true)
        }
    }
    @objc func correctAnswer() {
        setView(view: questionGoodJobLabel, hidden: false)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
            self.setView(view: self.questionGoodJobLabel, hidden: true)
        }
    }
    
    @objc func nextQuestion() {
        if(questionNumber == 1) {
            question2()
        }
        else if(questionNumber == 2) {
            question3()
        }
        else if(questionNumber == 3) {
            question4()
        }
        else if(questionNumber == 4) {
            question5()
        }
        else {
            question1()
        }
    }
    
/* BUTTON ACTIONS */
    
    @IBAction func playButtonAction(_ sender: Any) {
        questionScreen()
    }
    
    @IBAction func tryAgainAction(_ sender: Any) {
        questionScreen()
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        token = ""
        hsToken = 0
        nameTextField.text = ""
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: "playerName")
        defaults.set(hsToken, forKey: "highScore")
        introScreen()
    }
    @IBAction func nameButtonAction(_ sender: Any) {
        token = nameTextField.text!
        nameTextField.resignFirstResponder()
        if (token == "") {
            setView(view: nameErrorLabel, hidden: false)
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                self.setView(view: self.nameErrorLabel, hidden: true)
            }
        }
        else {
            let defaults = UserDefaults.standard
            defaults.set(token, forKey: "playerName")
            homeScreen()
        }
    }
    @IBAction func backHomeButtonAction(_ sender: Any) {
        homeScreen()
    }
    
    /* RANDOM QUESTIONS */
       /*
        
        @objc func nextQuestion() {
            let randomFunc = [question1, question2, question3, question4, question5]
            let randomResult = Int(arc4random_uniform(UInt32(randomFunc.count)))
            randomFunc[randomResult]()

        }
        func questionRandom<T>( array: inout [T]) -> [T] {
            for index in Array(0..<array.count) {
                let randomIndex = Int(arc4random_uniform(UInt32(index)))
                (array[index], array[randomIndex]) = (array[randomIndex], array[index])
            }
            
            return array
        }
         
        let questionFinished = questionRandom(array)
        var randomIndex = Int()
        let NumberOfFunctions = 5
        var chosenIndexes: [Int] = []{
            didSet{
                if chosenIndexes.count == NumberOfFunctions { chosenIndexes.removeAll() }
            }
        }
        func functionSelector(){
            repeat{
                randomIndex = Int.randomOutOf(NumberOfFunctions)
                print("selected: \(randomIndex) \(chosenIndexes)")
            } while chosenIndexes.contains(randomIndex)

            chosenIndexes.append(randomIndex)

            switch randomIndex {
            case 0: question1()
            case 1: question2()
            case 2: question3()
            case 3: question4()
            case 4: question5()
            default: break
            }
        }
        //your extension to pick random
        private extension Int {
            static func randomOutOf(max:Int) ->Int{
                return Int(arc4random() % UInt32(max)) // returns 0 - max
            }
        }
        
       var questionArray = [
           question1,
           question2,
           question3,
           question4,
           question5]
       let dictionaryOfFunctions = [
           "question1": question1,
           "question2": question2,
           "question3": question3,
           "question4": question4,
           "question5": question5,
       ]
       var indexes = [Int]();
       func randomQuestion() -> func
       {
           if indexes.count == 0
           {
               indexes = Array(0..<questionArray.count)
           }
           let randomIndex = Int(arc4random_uniform(UInt32(indexes.count)))
           let anIndex = indexes.remove(at: randomIndex)
           return questionArray[anIndex].0;
       }
    */
    
}

