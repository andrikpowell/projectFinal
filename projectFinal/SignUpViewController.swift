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
        TimerViewController().timerReset()
        nameTextField.text = ""
        let defaults = UserDefaults.standard
        defaults.set(global.token, forKey: "playerName")
        defaults.set(global.hsToken, forKey: "highScore")

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


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
