//
//  TimerViewController.swift
//  projectFinal
//
//  Created by Andrik on 4/30/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var timer = Timer()

    @IBOutlet weak var TimerLabel: UILabel?
    @IBOutlet weak var anxietyLabel: UILabel?
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet weak var scoreTextLabel: UILabel?
    //var tmpString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*if global.isTimerRunning==false {
            runTimer()
        }*/
    }
    override func viewDidAppear(_ animated: Bool) {
        if global.isTimerRunning==false {
            runTimer()
        }
        scoreLabel?.text = "\(global.score)"
        TimerLabel?.text = "1:20"
    }
    
    func timerReset() {
        global.timerSeconds = 80
        TimerLabel?.textColor = UIColor.black
    }
    
    func updateScoreLabel() {
        viewWillAppear(true)
        scoreLabel?.text = "\(global.score)"
        print(global.score)
    }
    
    /* SCORE FUNCTION */
        
    func didScore(points:Int){
        global.score += points
        updateScoreLabel()
       }

    @objc func updateTimer() {
        TimerViewController().viewWillAppear(true)
        global.timerSeconds -= 1     //This will decrement(count down)the seconds.
        TimerLabel?.text = timeString(time: TimeInterval(global.timerSeconds))  //This will update the label.
        if(global.timerSeconds == 0) {
            timer.invalidate()
            QuizViewController().tryAgainScreen()
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
            TimerLabel?.textColor = UIColor.systemRed
            anxietyLabel?.textColor = UIColor.systemRed
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
