//
//  Q5ViewController.swift
//  projectFinal
//
//  Created by Andrik on 4/30/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class Q5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        global.questionNumber = 5
        global.questionLabelNumber += 1
        q5blueButton.backgroundColor = UIColor.systemPurple
        q5greenButton.backgroundColor = UIColor.systemRed
        q5purpleButton.backgroundColor = UIColor.systemBlue
        q5redButton.backgroundColor = UIColor.systemGreen
        welcomeLabel.text = "Question \(global.questionLabelNumber)"
        descriptionLabel.text = "Select the button that says GREEN"

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var q5purpleButton: UIButton!
    @IBOutlet weak var q5greenButton: UIButton!
    @IBOutlet weak var q5redButton: UIButton!
    @IBOutlet weak var q5blueButton: UIButton!
    
    /* COLOR BUTTONS */
    
    @IBAction func q5purpleButtonAction(_ sender: UIButton) {
        if(global.questionNumber == 5) {
            wrongAnswer()
        }

    }
    @IBAction func q5greenButtonAction(_ sender: UIButton) {
        if(global.questionNumber == 5) {
            didScore(points:10)
            nextQuestion()
            correctAnswer()
        }
    }
    
    @IBAction func q5redButtonAction(_ sender: UIButton) {
        if(global.questionNumber == 5) {
            wrongAnswer()
        }

    }
    
    @IBAction func q5blueButtonAction(_ sender: UIButton) {
        if(global.questionNumber == 5) {
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
