//
//  StatsViewController.swift
//  projectFinal
//
//  Created by Andrik on 5/6/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var homeScoreNumberLabel: UILabel!
    @IBOutlet weak var answeredQuestionsLabel: UILabel!
    @IBOutlet weak var correctQuestionsLabel: UILabel!
    @IBOutlet weak var wrongQuestionsLabel: UILabel!
    @IBOutlet weak var QuestionTypePLabel: UILabel!
    @IBOutlet weak var QuestionTypeSLabel: UILabel!
    @IBOutlet weak var QuestionTypeBLabel: UILabel!
    @IBOutlet weak var QuestionTypeCLabel: UILabel!
    @IBOutlet weak var QuestionTypePKLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        global.token = defaults.string(forKey: "playerName") ?? ""
        global.hsToken = defaults.integer(forKey: "highScore")
        global.scoreQuestionNumber = defaults.integer(forKey: "highScoreNumber")
        global.scoreQuestionCorrect = defaults.integer(forKey: "highScoreCorrect")
        global.scoreQuestionWrong = defaults.integer(forKey: "highScoreWrong")
        global.scoreTypePicture = defaults.integer(forKey: "highScoreTypeP")
        global.scoreTypeSlider = defaults.integer(forKey: "highScoreTypeS")
        global.scoreTypeButton = defaults.integer(forKey: "highScoreTypeB")
        global.scoreTypeCharacter = defaults.integer(forKey: "highScoreTypeC")
        global.scoreTypePicker = defaults.integer(forKey: "highScoreTypePK")
        global.areQuestionsDone = true
        print("")
        print("-------")
        print("-------")
        print("Answered: \(global.scoreQuestionNumber)")
        print("Correct: \(global.scoreQuestionCorrect)")
        print("Wrong: \(global.scoreQuestionWrong)")
        print("-------")
        print("Picture: \(global.scoreTypePicture)")
        print("Slider: \(global.scoreTypeSlider)")
        print("Button: \(global.scoreTypeButton)")
        print("Chars: \(global.scoreTypeCharacter)")
        print("Picker: \(global.scoreTypePicker)")
        print("-------")
        print("-------")
        print("")
           if(global.darkMode == true) {
               darkModeActions()
           }
           else {
               lightModeActions()
           }
           if(global.token == "") || (global.token == nil) {
               //introScreen()
               performSegue(withIdentifier: "SignUpSegue", sender: self)
           }
           else {
               homeScoreLabel.text = "\(global.token)'s High Score:"
               homeScoreNumberLabel.text = "\(global.hsToken)"
               answeredQuestionsLabel.text = "\(global.scoreQuestionNumber)"
               correctQuestionsLabel.text = "\(global.scoreQuestionCorrect)"
               wrongQuestionsLabel.text = "\(global.scoreQuestionWrong)"
               QuestionTypeBLabel.text = "\(global.scoreTypeButton)"
               QuestionTypePLabel.text = "\(global.scoreTypePicture)"
               QuestionTypeSLabel.text = "\(global.scoreTypeSlider)"
               QuestionTypeCLabel.text = "\(global.scoreTypeCharacter)"
               QuestionTypePKLabel.text = "\(global.scoreTypePicker)"

               QuizViewController().timerReset()
           }

        
       }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
