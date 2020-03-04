//
//  ViewController.swift
//  projectOne
//
//  Created by Powell, Andrik on 2/24/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

/* VARIABLES AND OUTLETS */
    var score:Int = 0
    var timer = Timer()
    var seconds = 40 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var isTimerRunning:Bool = false //This will be used to make sure only one timer is created at a time.
    var chars:Int = 0
    var token:String = ""
    var hsToken:Int = 30
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
    
/* TRYING TO FIGURE OUT HOW TO DO RANDOM QUESTIONS */
    /*
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
    func randomQuestion() -> self
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
    @IBOutlet weak var PreviousHighScoreLabel: UILabel!
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
    
    /* QUESTION 3 SWITCHES*/
    
    @IBAction func q2purpleButtonAction(_ sender: UIButton) {
        if(questionNumber == 3) {
            setView(view: questionWrongLabel, hidden: false)
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                self.setView(view: self.questionWrongLabel, hidden: true)
            }
        }
        else if(questionNumber == 5) {
            setView(view: questionWrongLabel, hidden: false)
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                self.setView(view: self.questionWrongLabel, hidden: true)
        }
        }

    }
    @IBAction func q2greenButtonAction(_ sender: UIButton) {
        if(questionNumber == 3) {
            setView(view: questionWrongLabel, hidden: false)
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                self.setView(view: self.questionWrongLabel, hidden: true)
            }
        }
        else if(questionNumber == 5) {
            didScore(points:10)
            question1()
            setView(view: questionGoodJobLabel, hidden: false)
             Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                 self.setView(view: self.questionGoodJobLabel, hidden: true)
        }
        }
    }
    
    @IBAction func q2redButtonAction(_ sender: UIButton) {
        if(questionNumber == 3) {
            setView(view: questionWrongLabel, hidden: false)
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                self.setView(view: self.questionWrongLabel, hidden: true)
            }
        }
        else if(questionNumber == 5) {
            setView(view: questionWrongLabel, hidden: false)
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                self.setView(view: self.questionWrongLabel, hidden: true)
        }
        }

    }
    
    @IBAction func q2blueButtonAction(_ sender: UIButton) {
        if(questionNumber == 3) {
            didScore(points:10)
            question4()
            setView(view: questionGoodJobLabel, hidden: false)
             Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                 self.setView(view: self.questionGoodJobLabel, hidden: true)
            }
        }
        else if(questionNumber == 5) {
            setView(view: questionWrongLabel, hidden: false)
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                self.setView(view: self.questionWrongLabel, hidden: true)
        }
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
        seconds -= 1     //This will decrement(count down)the seconds.
        TimerLabel.text = timeString(time: TimeInterval(seconds))  //This will update the label.
        if(seconds == 0) {
            timer.invalidate()
            tryAgainScreen()
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
                question2()
                setView(view: questionGoodJobLabel, hidden: false)
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                    self.setView(view: self.questionGoodJobLabel, hidden: true)
                }
            }
            else
            {
                //questionWrongLabel.isHidden = false
                setView(view: questionWrongLabel, hidden: false)
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                    self.setView(view: self.questionWrongLabel, hidden: true)
                }
            }
        }
        else if(questionNumber == 2) {
            if(sliderAnswer == 5)
            {
                didScore(points:10)
                question3()
                setView(view: questionGoodJobLabel, hidden: false)
                 Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                     self.setView(view: self.questionGoodJobLabel, hidden: true)
                 }

            }
            else
            {
                setView(view: questionWrongLabel, hidden: false)
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                    self.setView(view: self.questionWrongLabel, hidden: true)
                }
            }
        }
            if(questionNumber == 4) {
                let q4word = q4textField.text!
                chars = q4word.count
                if (chars == 6) {
                    didScore(points:10)
                    question5()
                    setView(view: questionGoodJobLabel, hidden: false)
                     Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                         self.setView(view: self.questionGoodJobLabel, hidden: true)
                     }
                }
                    else {
                        setView(view: questionWrongLabel, hidden: false)
                        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                            self.setView(view: self.questionWrongLabel, hidden: true)
                        }

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
        welcomeLabel.text = "Question 1"
        descriptionLabel.text = "Choose the images that reflect NATURE"
    }
    
    @objc func question2() {
        questionClear()
        questionNumber = 2
        setView(view: q2Slider, hidden: false)
        setView(view: q2SliderArrow, hidden: false)
        welcomeLabel.text = "Question 2"
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
        welcomeLabel.text = "Question 3"
        descriptionLabel.text = "Select the button that says BLUE"
    }
    
    @objc func question4() {
        questionClear()
        questionNumber = 4
        setView(view: q4textField, hidden: false)
        welcomeLabel.text = "Question 4"
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
        welcomeLabel.text = "Question 5"
        descriptionLabel.text = "Select the button that says GREEN"
    }


        
/* APP SCREENS */
    
    @objc func homeScreen() {
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "playerName")!
        /*
        let hsDefaults = UserDefaults.standard
        let hsToken = hsDefaults.integer(forKey: "highScore")
        PreviousHighScoreLabel.text = "High Score: \(hsToken)"
         */
        areQuestionsDone = false
        welcomeLabel.text = "Welcome, \(token)"
        homeScoreNumberLabel.text = "\(score)"
        setView(view: nameLabel, hidden: true)
        setView(view: nameDisclaimerLabel1, hidden: true)
        setView(view: nameDisclaimerLabel2, hidden: true)
        setView(view: nameTextField, hidden: true)
        setView(view: nameButton, hidden: true)
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
        seconds = 40
    }
    
    @objc func introScreen() {
        welcomeLabel.text = "Welcome"
        setView(view: nameLabel, hidden: false)
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
        seconds = 40
    }

    @objc func questionScreen() {
        seconds = 40
        score = 0
        areQuestionsDone = false
        scoreLabel.text = "\(score)"
        if isTimerRunning == false {
            runTimer()
        }
        question1()
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
    }
    
    @objc func tryAgainScreen() {
        areQuestionsDone = true
        TimerLabel.text = "0:40"
        welcomeLabel.text = "Try Again?"
        descriptionLabel.text = ""
        finalScoreNumberLabel.text = "\(score)"
        questionClear()
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
        /*
        let hsDefaults = UserDefaults.standard
        let hsToken = hsDefaults.integer(forKey: "highScore")
        PreviousHighScoreLabel.text = "High Score: \(hsToken)"
         
        if(score > hsToken) {
            hsDefaults.set(hsToken, forKey: "highScore")
        }
        else {
            score = 0
        }
        */
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
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: "playerName")
        introScreen()
    }
    @IBAction func nameButtonAction(_ sender: Any) {
        token = nameTextField.text!
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: "playerName")
        homeScreen()
    }
    @IBAction func backHomeButtonAction(_ sender: Any) {
        homeScreen()
    }

/* UPON APP LOAD */
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "playerName")!
        if(token == "") {
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


        /*
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
        
        /*
        let hsDefaults = UserDefaults.standard
        let hsToken = hsDefaults.integer(forKey: "highScore")
        PreviousHighScoreLabel.text = "High Score: \(hsToken)"
        Do any additional setup after loading the view.
        */

    }

    
}

