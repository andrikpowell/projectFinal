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
    var timer = Timer()
    var timerSeconds = 80 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var isTimerRunning:Bool = false //This will be used to make sure only one timer is created at a time.
    var token:String = ""
    var hsToken:Int = 0
    var questionNumber = 0
    var areQuestionsDone:Bool = false
    var questionLabelNumber:Int = 0
    //let defaults = UserDefaults.standard
}
let global = Global()
