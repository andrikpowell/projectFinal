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
    @IBOutlet weak var playButton: UIButton!
    var nameCheck:String = ""

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
    func darkModeActions() {
            tabBarController?.tabBar.barStyle = .black
            tabBarController?.overrideUserInterfaceStyle = .dark
            overrideUserInterfaceStyle = .dark
            view.setNeedsDisplay()
    }

    func lightModeActions() {
            tabBarController?.tabBar.barStyle = .default
            tabBarController?.overrideUserInterfaceStyle = .light
            overrideUserInterfaceStyle = .light
            view.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*var localToken = global.defaults.string(forKey: "playerName")*/
        let defaults = UserDefaults.standard
        let nameCheck = defaults.string(forKey: "playerName")
        print("\(String(describing: nameCheck))")
        global.hsToken = defaults.integer(forKey: "highScore")
        global.darkMode = defaults.bool(forKey: "darkMode")
        global.areQuestionsDone = false
        if(global.darkMode == true) {
            darkModeActions()
        }
        else {
            lightModeActions()
        }
        if(nameCheck == "") || (nameCheck == nil) {
            performSegue(withIdentifier: "SignUpSegue", sender: self)
        }
        else {
            global.token = nameCheck!
            welcomeLabel.text = "Welcome, \(String(describing: global.token))"
            QuizViewController().timerReset()
        }

    }
    override func viewDidAppear(_ animated: Bool) {
        //let defaults = UserDefaults.standard
        let defaults = UserDefaults.standard
        let nameCheck = defaults.string(forKey: "playerName")
        print("\(String(describing: nameCheck))")
        global.hsToken = defaults.integer(forKey: "highScore")
        global.darkMode = defaults.bool(forKey: "darkMode")
        global.areQuestionsDone = false
        if(global.darkMode == true) {
            darkModeActions()
        }
        else {
            lightModeActions()
        }
        if(nameCheck == "") || (nameCheck == nil) {
            performSegue(withIdentifier: "SignUpSegue", sender: self)
        }
        else {
            global.token = nameCheck!
            welcomeLabel.text = "Welcome, \(String(describing: global.token))"
            QuizViewController().timerReset()
        }
        
    }

    /* BUTTON ACTIONS */
    
    @IBAction func playButtonAction(_ sender: Any) {
        //questionScreen()
        QuizViewController().timerReset()
        global.score = 0
        global.questionLabelNumber = 0
        global.questionNumber = 0
        global.scoreQuestionNumber = 0
        global.scoreQuestionCorrect = 0
        global.scoreQuestionWrong = 0
        global.scoreTypeButton = 0
        global.scoreTypeSlider = 0
        global.scoreTypePicture = 0
        global.scoreTypePicker = 0
        global.scoreTypeCharacter = 0
        global.questionLabelNumber = 0
        global.questionNumber = 0
        global.areQuestionsDone = false
        //TimerViewController().runTimer()
        performSegue(withIdentifier: "QuizSegue", sender: self)
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
