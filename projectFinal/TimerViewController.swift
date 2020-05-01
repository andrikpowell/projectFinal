//
//  TimerViewController.swift
//  projectFinal
//
//  Created by Andrik on 4/30/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var anxietyLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(scoreLabel.text == nil) {
            scoreLabel.text = "1:20"
        }
        else {
            
        }
        // Do any additional setup after loading the view.
    }
    
    func timerReset() {
        global.timerSeconds = 80
        //TimerViewController().TimerLabel.textColor = UIColor.black
    }

    @objc func updateTimer() {
        global.timerSeconds -= 1     //This will decrement(count down)the seconds.
        TimerLabel.text = timeString(time: TimeInterval(global.timerSeconds))  //This will update the label.
        if(global.timerSeconds == 0) {
            global.timer.invalidate()
            //ViewController().tryAgainScreen()
            if Q1ViewController().viewIfLoaded?.window != nil {
                performSegue(withIdentifier: "ResultsSegue", sender: self)
            }
            else if Q2ViewController().viewIfLoaded?.window != nil {
            performSegue(withIdentifier: "ResultsSegue", sender: self)
            }
            else if Q3ViewController().viewIfLoaded?.window != nil {
            performSegue(withIdentifier: "ResultsSegue", sender: self)
            }
            else if Q4ViewController().viewIfLoaded?.window != nil {
            performSegue(withIdentifier: "ResultsSegue", sender: self)
            }
            else if Q5ViewController().viewIfLoaded?.window != nil {
            performSegue(withIdentifier: "ResultsSegue", sender: self)
            }

        }
        else if(global.timerSeconds <= 20) {
            TimerViewController().TimerLabel.textColor = UIColor.systemRed
            TimerViewController().anxietyLabel.textColor = UIColor.systemRed
        }
    }
    
    @objc func runTimer() {
        global.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController().updateTimer)), userInfo: nil, repeats: true)
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
