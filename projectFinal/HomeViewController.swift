//
//  HomeViewController.swift
//  projectFinal
//
//  Created by Andrik on 4/30/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var homeScoreNumberLabel: UILabel!
/*
    func showSomeViewController() {
        self.performSegue(withIdentifier: "timerSegue", sender: self);
    }

    func prepareForSegue(segue: Q1Segue, sender: AnyObject?) {

        if (segue.identifier == "timerSegue")
        {
            let vc: TimerViewController = segue.destinationViewController as! TimerViewController
            vc.scoreLabel.text = "say ho"
        }
    }
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        /*var localToken = global.defaults.string(forKey: "playerName")*/
        let defaults = UserDefaults.standard
        global.token = defaults.string(forKey: "playerName") ?? ""
        global.hsToken = defaults.integer(forKey: "highScore")
        global.areQuestionsDone = false
        if(global.token == "") || (global.token == nil) {
            //introScreen()
            performSegue(withIdentifier: "SignUpSegue", sender: self)
        }
        else {
            welcomeLabel.text = "Welcome, \(String(describing: global.token))"
            homeScoreNumberLabel.text = "\(global.hsToken)"
            TimerViewController().timerReset()
        }
    }

    /* BUTTON ACTIONS */
    
    @IBAction func playButtonAction(_ sender: Any) {
        //questionScreen()
        TimerViewController().timerReset()
        global.score = 0
        global.questionLabelNumber = 0
        global.questionNumber = 0
        global.areQuestionsDone = false
        //TimerViewController().runTimer()
        performSegue(withIdentifier: "QuizSegue", sender: self)
    }
    
    
    @IBAction func resetButtonAction(_ sender: Any) {
        global.token = ""
        global.hsToken = 0
        //SignUpViewController().nameTextField.text = ""
        let defaults = UserDefaults.standard
        defaults.set(global.token, forKey: "playerName")
        defaults.set(global.hsToken, forKey: "highScore")
        performSegue(withIdentifier: "SignUpSegue", sender: self)
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
