//
//  QuizViewController.swift
//  projectFinal
//
//  Created by Andrik on 5/3/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    /*func changeLabel(text: String) {
        objTimerViewController?.localScore = global.score
    }*/
    /*
    @IBOutlet var containerView: UIView!
    var objTimerViewController: TimerViewController?
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TimerSegue" {
            objTimerViewController = segue.destination as? TimerViewController
            objTimerViewController!.containerToMaster = self
        }
    }
 */

    /* OUTLETS */
        var chars:Int = 0
        var nature1 = false
        var nature2 = false
        var nature3 = false
        var nature4 = false
        var q3button1 = false
        var q3button2 = false
        var q3button3 = false
        var q3button4 = false
        var pickerVar = String()
        
    /* OUTLETS */

        @IBOutlet weak var welcomeLabel: UILabel!
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
        @IBOutlet weak var q2purpleButton: UIButton!
        @IBOutlet weak var q2greenButton: UIButton!
        @IBOutlet weak var q2redButton: UIButton!
        @IBOutlet weak var q2blueButton: UIButton!
        @IBOutlet weak var q4textField: UITextField!
        @IBOutlet weak var q6picker: UIPickerView!
      
        /* UPON APP LOAD */
            override func viewDidLoad() {
                super.viewDidLoad()
                
                let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.q1nature1ImageSelect))
                let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.q1nature2ImageSelect))
                let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.q1nature3ImageSelect))
                let tap4 = UITapGestureRecognizer(target: self, action: #selector(self.q1nature4ImageSelect))

                q1nature1BG.addGestureRecognizer(tap1)
                q1nature2BG.addGestureRecognizer(tap2)
                q1nature3BG.addGestureRecognizer(tap3)
                q1nature4BG.addGestureRecognizer(tap4)
                
                if(global.darkMode == true) {
                           darkModeActions()
                       }
                       else {
                           lightModeActions()
                       }

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
    
       var timer = Timer()

       @IBOutlet weak var TimerLabel: UILabel!
       @IBOutlet weak var anxietyLabel: UILabel!
       @IBOutlet weak var scoreLabel: UILabel!
       @IBOutlet weak var scoreTextLabel: UILabel!
       var localScore:Int = 0
       //var tmpString: String!
       
       func timerReset() {
           global.timerSeconds = 80
           //TimerLabel.textColor = UIColor.black
       }
       
       func updateScoreLabel() {
           viewWillAppear(true)
           localScore = global.score
           scoreLabel.text = "\(localScore)"
           //containerToMaster?.changeLabel(text: "\(localScore)")
       }
       
       /* SCORE FUNCTION */
           
       func didScore(points:Int){
           global.score += points
           updateScoreLabel()
          }

       @objc func updateTimer() {
           //viewWillAppear(true)
           global.timerSeconds -= 1     //This will decrement(count down)the seconds.
           TimerLabel.text = timeString(time: TimeInterval(global.timerSeconds))  //This will update the label.
           if(global.timerSeconds == 0) {
               timer.invalidate()
            tryAgainScreen()
               /*
               if Q1ViewController().isBeingPresented {
                   performSegue(withIdentifier: "ResultsSegue", sender: Q1ViewController())
               }
               else if Q2ViewController().isBeingPresented {
               performSegue(withIdentifier: "ResultsSegue", sender: self)
               }
               else if Q3ViewController().isBeingPresented {
               performSegue(withIdentifier: "ResultsSegue", sender: self)
               }
               else if Q4ViewController().isBeingPresented {
               performSegue(withIdentifier: "ResultsSegue", sender: self)
               }
               else if Q5ViewController().isBeingPresented {
               performSegue(withIdentifier: "ResultsSegue", sender: self)
               }
               else {
                   TimerLabel?.text = "didn't work"
               }
    */

           }
           else if(global.timerSeconds <= 20) {
               TimerLabel.textColor = UIColor.systemRed
               anxietyLabel.textColor = UIColor.systemRed
           }
       }
       /*
       @objc func updateScoreText() {
           scoreLabel?.text = "\(global.score)"
           TimerLabel?.text = timeString(time: TimeInterval(global.timerSeconds))  //This will update the label.
           if global.isTimerRunning == false {
               runTimer()
           }
           TimerViewController().viewWillAppear(true)
       }
    */
       
       @objc func runTimer() {
           timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
       }
       
       func timeString(time:TimeInterval) -> String {
           //let hours = Int(time) / 3600
           let minutes = Int(time) / 60 % 60
           let seconds = Int(time) % 60
           return String(format:"%2i:%02i", minutes, seconds)
       }

    
    
    override func viewDidAppear(_ animated: Bool) {
        timerReset()
        global.score = 0
        global.areQuestionsDone = false
        //TimerViewController().updateScoreLabel()
        TimerLabel.text = timeString(time: TimeInterval(global.timerSeconds))  //This will update the label.
        if global.isTimerRunning == false {
            runTimer()
        }
        nextQuestion()
        
        localScore = global.score
        scoreLabel.text = "\(localScore)"
        //containerToMaster?.changeLabel(text: "\(localScore)")
        TimerLabel.text = "1:20"
        q6picker.delegate = self
        q6picker.dataSource = self
    }
    
    func darkModeActions() {
            overrideUserInterfaceStyle = .dark
    }

    func lightModeActions() {
            overrideUserInterfaceStyle = .light
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
            if(global.questionNumber == 3) {
                wrongAnswer()
                nextQuestion()
            }
            else if(global.questionNumber == 5) {
                wrongAnswer()
                nextQuestion()
            }

        }
        @IBAction func q2greenButtonAction(_ sender: UIButton) {
            if(global.questionNumber == 3) {
                wrongAnswer()
                nextQuestion()
            }
            else if(global.questionNumber == 5) {
                global.scoreTypeButton += 1
                nextQuestion()
                correctAnswer()
            }
        }
        
        @IBAction func q2redButtonAction(_ sender: UIButton) {
            if(global.questionNumber == 3) {
                wrongAnswer()
                nextQuestion()
            }
            else if(global.questionNumber == 5) {
                wrongAnswer()
                nextQuestion()
            }

        }
        
        @IBAction func q2blueButtonAction(_ sender: UIButton) {
            if(global.questionNumber == 3) {
                global.scoreTypeButton += 1
                correctAnswer()
                nextQuestion()
            }
            else if(global.questionNumber == 5) {
                wrongAnswer()
                nextQuestion()
            }
        }
        
        
        
    /* SCORE FUNCTION */
        /*
        func didScore(points:Int){
            global.score += points
            TimerViewController().updateScoreLabel()
           }
 */
        
    /* FADE OPACITY CODE */
        func setView(view: UIView, hidden: Bool) {
            UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
                view.isHidden = hidden
            })
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
    
    
    /* PICKER VIEW */
    
    // array to hold your selections
    let items = ["Dog","Cat","Walrus","Llama","Mouse"]
        
    //  variable to evaluate the selection
    var selection:String!
    
    // four functions associated with pickerview
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection = items[row]
        pickerVar = selection
        print(pickerVar)
    }
        
    /* BUTTON SUBMIT - DECIDES WHICH QUESTION TO DO NEXT */

        @IBAction func questionSubmit(_ sender: UIButton) {
            if(global.areQuestionsDone == false) {
            if(global.questionNumber == 1) {
                if(nature1 == true && nature2 == true && nature3 == false && nature4 == true)
                {
                    global.scoreTypePicture += 1
                    nextQuestion()
                    correctAnswer()
                }
                else
                {
                    wrongAnswer()
                    nextQuestion()
                }
            }
            else if(global.questionNumber == 2) {
                if(sliderAnswer == 5)
                {
                    nextQuestion()
                    correctAnswer()
                    global.scoreTypeSlider += 1
                }
                else
                {
                    wrongAnswer()
                    nextQuestion()
                }
            }
                if(global.questionNumber == 4) {
                    let q4word = q4textField.text!
                    chars = q4word.count
                    q4textField.resignFirstResponder()
                    if (chars == 6) {
                        nextQuestion()
                        global.scoreTypeCharacter += 1
                        correctAnswer()
                    }
                        else {
                        wrongAnswer()
                        nextQuestion()
                        }

                }
                if(global.questionNumber == 6) {
                    if (pickerVar == "Llama") {
                        nextQuestion()
                        global.scoreTypePicker += 1
                        correctAnswer()
                    }
                        else {
                        wrongAnswer()
                        nextQuestion()
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
            global.questionNumber = 1
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
            global.questionNumber = 2
            setView(view: q2Slider, hidden: false)
            setView(view: q2SliderArrow, hidden: false)
            descriptionLabel.text = "Move the slider to where the ARROW is pointing"
        }
        
        @objc func question3() {
            questionClear()
            global.questionNumber = 3
            setView(view: questionSubmitButton, hidden: true)
            setView(view: q2purpleButton, hidden: false)
            setView(view: q2greenButton, hidden: false)
            setView(view: q2redButton, hidden: false)
            setView(view: q2blueButton, hidden: false)
            descriptionLabel.text = "Select the button that says BLUE"
        }
        
        @objc func question4() {
            questionClear()
            global.questionNumber = 4
            setView(view: q4textField, hidden: false)
            descriptionLabel.text = "Type in a 6 LETTER word:"
        }
        @objc func question5() {
            questionClear()
            global.questionNumber = 5
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
        @objc func question6() {
            questionClear()
            global.questionNumber = 6
            setView(view: q6picker, hidden: false)
            setView(view: questionSubmitButton, hidden: false)
            descriptionLabel.text = "Select an animal with a LONG NECK"
        }
        
        func questionClear() {
            //setView(view: questionWrongLabel, hidden: true)
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
            setView(view: welcomeLabel, hidden: false)
            setView(view: descriptionLabel, hidden: false)
            setView(view: q4textField, hidden: true)
            setView(view: q6picker, hidden: true)
            q6picker.selectRow(0, inComponent: 0, animated: true)
            selection = "Dog"
            pickerVar = selection
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
            global.questionLabelNumber += 1
            welcomeLabel.text = "Question \(global.questionLabelNumber)"
            
        }
        
        @objc func tryAgainScreen() {
            DispatchQueue.main.async(){
               self.performSegue(withIdentifier: "ResultsSegue", sender: self)
            }
        }
        
        @objc func wrongAnswer() {
            global.scoreQuestionWrong += 1
            setView(view: questionWrongLabel, hidden: false)
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                self.setView(view: self.questionWrongLabel, hidden: true)
            }
        }
        @objc func correctAnswer() {
            global.scoreQuestionCorrect += 1
            didScore(points: 10)
            setView(view: questionGoodJobLabel, hidden: false)
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
                self.setView(view: self.questionGoodJobLabel, hidden: true)
            }
        }
        
        @objc func nextQuestion() {
            if(global.questionNumber == 1) {
                question2()
            }
            else if(global.questionNumber == 2) {
                question3()
            }
            else if(global.questionNumber == 3) {
                question4()
            }
            else if(global.questionNumber == 4) {
                question5()
            }
            else if(global.questionNumber == 5) {
                question6()
            }
            else {
                question1()
            }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
