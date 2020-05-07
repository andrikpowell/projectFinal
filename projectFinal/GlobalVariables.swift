//
//  GlobalVariables.swift
//  projectFinal
//
//  Created by Andrik on 4/30/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import Foundation
import UIKit

class Global {
    var score:Int = 0
    var timerSeconds = 80 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var isTimerRunning:Bool = false //This will be used to make sure only one timer is created at a time.
    var token:String = ""
    var hsToken:Int = 0
    var questionNumber = 0
    var areQuestionsDone:Bool = false
    var questionLabelNumber:Int = 0
    var darkMode:Bool = false
    //let defaults = UserDefaults.standard
    //var objTimerViewController : TimerViewController?
    //var objHomeViewController : HomeViewController?
    //var objResultsViewController : ResultsViewController?
    var scoreQuestionNumber:Int = 0
    var scoreQuestionCorrect:Int = 0
    var scoreQuestionWrong:Int = 0
    var scoreTypePicture:Int = 0
    var scoreTypeSlider:Int = 0
    var scoreTypeButton:Int = 0
    var scoreTypeCharacter:Int = 0
    var scoreTypePicker:Int = 0
}
let global = Global()
