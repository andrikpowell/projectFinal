//
//  SignUpViewController.swift
//  projectFinal
//
//  Created by Andrik on 4/29/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameDisclaimerLabel1: UILabel!
    @IBOutlet weak var nameDisclaimerLabel2: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var nameErrorLabel: UILabel!
    
        
    override func viewWillAppear(_ animated: Bool){
        //timerReset()
        global.score = 0
        global.token = ""
        global.hsToken = 0
        global.scoreTypeCharacter = 0
        global.scoreTypePicture = 0
        global.scoreTypeSlider = 0
        global.scoreTypeButton = 0
        global.scoreQuestionWrong = 0
        global.scoreQuestionCorrect = 0
        global.scoreQuestionNumber = 0
        if global.darkMode == true {
            lightModeActions()
        }
        global.darkMode = false
        TimerViewController().timerReset()
        nameTextField.text = ""
        let defaults = UserDefaults.standard
        defaults.set("", forKey: "playerName")
        defaults.set(global.hsToken, forKey: "highScore")
        defaults.set(global.darkMode, forKey: "darkMode")
        defaults.set(global.scoreQuestionNumber, forKey: "highScoreNumber")
        defaults.set(global.scoreQuestionCorrect, forKey: "highScoreCorrect")
        defaults.set(global.scoreQuestionWrong, forKey: "highScoreWrong")
        defaults.set(global.scoreTypePicture, forKey: "highScoreTypeP")
        defaults.set(global.scoreTypePicker, forKey: "highScoreTypePK")
        defaults.set(global.scoreTypeSlider, forKey: "highScoreTypeS")
        defaults.set(global.scoreTypeButton, forKey: "highScoreTypeB")
        defaults.set(global.scoreTypeCharacter, forKey: "highScoreTypeC")
    }
    
    @IBAction func nameButtonActionSU(_ sender: Any) {
        global.token = nameTextField.text!
        nameTextField.resignFirstResponder()
        if (global.token == "") {
            setView(view: nameErrorLabel, hidden: false)
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (pause) in
            setView(view: self.nameErrorLabel, hidden: true)
            }
        }
        else {
            let defaults = UserDefaults.standard
            defaults.set(global.token, forKey: "playerName")
            performSegue(withIdentifier: "HomeSegue", sender: self)
        }
    }

    func lightModeActions() {
            tabBarController?.tabBar.barStyle = .default
            tabBarController?.overrideUserInterfaceStyle = .light
            overrideUserInterfaceStyle = .light
            view.setNeedsDisplay()
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
