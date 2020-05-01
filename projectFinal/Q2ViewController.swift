//
//  Q2ViewController.swift
//  projectFinal
//
//  Created by Andrik on 4/30/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class Q2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        global.questionNumber = 2
        global.questionLabelNumber += 1
        welcomeLabel.text = "Question \(global.questionLabelNumber)"
        descriptionLabel.text = "Move the slider to where the ARROW is pointing"


        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var questionSubmitButton: UIButton!

    
    /* SLIDER CODE */

    var sliderAnswer:Int = 2
    let step: Float = 1
    
    @IBOutlet weak var q2Slider: UISlider!
    
    @IBOutlet weak var q2SliderArrow: UIImageView!
    @IBAction func q2SliderAction(_ sender: UISlider) {
        sliderAnswer = Int(sender.value)
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
    }
    
    @IBAction func questionSubmit(_ sender: UIButton) {
    if(sliderAnswer == 5)
    {
        didScore(points:10)
        nextQuestion()
        //performSegue(withIdentifier: "Q2Segue", sender: self)
        correctAnswer()

    }
    else
    {
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
