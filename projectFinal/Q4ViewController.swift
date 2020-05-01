//
//  Q4ViewController.swift
//  projectFinal
//
//  Created by Andrik on 4/30/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class Q4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        global.questionNumber = 4
        global.questionLabelNumber += 1
        welcomeLabel.text = "Question \(global.questionLabelNumber)"
        descriptionLabel.text = "Type in a 6 LETTER word:"

        // Do any additional setup after loading the view.
    }
    
    var chars:Int = 0
   
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var q4textField: UITextField!
    @IBOutlet weak var questionSubmitButton: UIButton!
    
    @IBAction func questionSubmit(_ sender: UIButton) {
        let q4word = q4textField.text!
        chars = q4word.count
        q4textField.resignFirstResponder()
        if (chars == 6) {
            didScore(points:10)
            nextQuestion()
            correctAnswer()
        }
            else {
            wrongAnswer()
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
