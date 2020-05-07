//
//  ResultsViewController.swift
//  projectFinal
//
//  Created by Andrik on 4/30/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var MadeHighScoreLabel: UILabel!
    @IBOutlet weak var finalScoreNumberLabel: UILabel!
    @IBOutlet weak var finalHighScoreNumberLabel: UILabel!
    
    @IBAction func tryAgainAction(_ sender: Any) {
        performSegue(withIdentifier: "Q1Segue", sender: self)
        //questionScreen()
    }
    
    @IBAction func backHomeButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "HomeSegue", sender: self)
        //homeScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //questionClear()
        global.areQuestionsDone = true
        welcomeLabel.text = "Try Again?"
        finalScoreNumberLabel.text = "\(global.score)"
        global.scoreQuestionNumber = global.questionLabelNumber-1
        let defaults = UserDefaults.standard
        global.hsToken = defaults.integer(forKey: "highScore")
        if(global.darkMode == true) {
            darkModeActions()
        }
        else {
            lightModeActions()
        }
        if(global.score > global.hsToken) || (global.hsToken == 0) {
            defaults.set(global.score, forKey: "highScore")
            defaults.set(global.scoreQuestionNumber, forKey: "highScoreNumber")
            defaults.set(global.scoreQuestionCorrect, forKey: "highScoreCorrect")
            defaults.set(global.scoreQuestionWrong, forKey: "highScoreWrong")
            defaults.set(global.scoreTypePicture, forKey: "highScoreTypeP")
            defaults.set(global.scoreTypePicker, forKey: "highScoreTypePK")
            defaults.set(global.scoreTypeSlider, forKey: "highScoreTypeS")
            defaults.set(global.scoreTypeButton, forKey: "highScoreTypeB")
            defaults.set(global.scoreTypeCharacter, forKey: "highScoreTypeC")
            setView(view: MadeHighScoreLabel, hidden: false)
        }
        else {
            global.score = 0
            global.scoreTypeCharacter = 0
            global.scoreTypePicture = 0
            global.scoreTypePicker = 0
            global.scoreTypeSlider = 0
            global.scoreTypeButton = 0
            global.scoreQuestionWrong = 0
            global.scoreQuestionCorrect = 0
            global.scoreQuestionNumber = 0
            finalHighScoreNumberLabel.text = "High Score: \(global.hsToken)"
            setView(view: finalHighScoreNumberLabel, hidden: false)
        }
        /*setView(view: tryAgainButton, hidden: false)
        setView(view: backHomeButton, hidden: false)
        // Do any additional setup after loading the view.*/
        
    }
    
    func darkModeActions() {
            tabBarController?.tabBar.barStyle = .black
            overrideUserInterfaceStyle = .dark
    }

    func lightModeActions() {
            tabBarController?.tabBar.barStyle = .default
            overrideUserInterfaceStyle = .light
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
