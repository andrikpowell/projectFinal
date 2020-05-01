//
//  Q3ViewController.swift
//  projectFinal
//
//  Created by Andrik on 4/30/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class Q3ViewController: UIViewController {

    var q3button1 = false
    var q3button2 = false
    var q3button3 = false
    var q3button4 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        global.questionNumber = 3
        global.questionLabelNumber += 1
        welcomeLabel.text = "Question \(global.questionLabelNumber)"
        descriptionLabel.text = "Select the button that says BLUE"

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var q2purpleButton: UIButton!
    @IBOutlet weak var q2greenButton: UIButton!
    @IBOutlet weak var q2redButton: UIButton!
    @IBOutlet weak var q2blueButton: UIButton!
    
    
    /* COLOR BUTTONS */
    
    @IBAction func q2purpleButtonAction(_ sender: UIButton) {
        if(global.questionNumber == 3) {
            wrongAnswer()
        }
    }
    
    @IBAction func q2greenButtonAction(_ sender: UIButton) {
        if(global.questionNumber == 3) {
            wrongAnswer()
        }
    }
    
    @IBAction func q2redButtonAction(_ sender: UIButton) {
        if(global.questionNumber == 3) {
            wrongAnswer()
        }
    }
    
    @IBAction func q2blueButtonAction(_ sender: UIButton) {
        if(global.questionNumber == 3) {
            didScore(points:10)
            nextQuestion()
            correctAnswer()
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
