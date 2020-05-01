//
//  Q1ViewController.swift
//  projectFinal
//
//  Created by Andrik on 4/30/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class Q1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        global.questionNumber = 1
        global.questionLabelNumber += 1
        welcomeLabel.text = "Question \(global.questionLabelNumber)"
        descriptionLabel.text = "Choose the images that reflect NATURE"
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(q1nature1ImageSelect))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(q1nature2ImageSelect))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(q1nature3ImageSelect))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(q1nature4ImageSelect))
        q1nature1BG.addGestureRecognizer(tap1)
        q1nature2BG.addGestureRecognizer(tap2)
        q1nature3BG.addGestureRecognizer(tap3)
        q1nature4BG.addGestureRecognizer(tap4)
        // Do any additional setup after loading the view.
    }
    
    var nature1 = false
    var nature2 = false
    var nature3 = false
    var nature4 = false
    
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
    @IBOutlet weak var timerTest: UILabel!

    /*@objc func updateTimerTest() {
        global.timerSeconds -= 1     //This will decrement(count down)the seconds.
    timerTest.text = TimerViewController().timeString(time: TimeInterval(global.timerSeconds))  //This will update the label.
    }
    
    @objc func runTimer2() {
        global.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimerTest)), userInfo: nil, repeats: true)
    }
*/

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
    
    @IBAction func questionSubmit(_ sender: UIButton) {
        if(global.areQuestionsDone == false) {
            if(nature1 == true && nature2 == true && nature3 == false && nature4 == true)
            {
                didScore(points:10)
                nextQuestion()
                //performSegue(withIdentifier: "Q2Segue", sender: self)
                correctAnswer()
            }
            else
            {
                wrongAnswer()
            }
        }
        else {
            performSegue(withIdentifier: "ResultsSegue", sender: self)
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
