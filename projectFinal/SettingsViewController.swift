//
//  SettingsViewController.swift
//  projectFinal
//
//  Created by Andrik on 5/6/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if(global.darkMode == true) {
            darkModeButtonRef.isOn = true
            darkModeActions()
        }
        else {
            darkModeButtonRef.isOn = false
            lightModeActions()
        }
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var darkModeButtonRef: UISwitch!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBAction func darkModeButton(_ sender: Any) {
        if(global.darkMode == false) {
            darkModeActions()
            global.darkMode = true
            let defaults = UserDefaults.standard
            defaults.set(global.darkMode, forKey: "darkMode")
            darkModeButtonRef.isOn = true
            print("Dark Mode: \(global.darkMode)")
        }
        else {
            global.darkMode = false
            let defaults = UserDefaults.standard
            defaults.set(global.darkMode, forKey: "darkMode")
            lightModeActions()
            darkModeButtonRef.isOn = false
            print("Dark Mode: \(global.darkMode)")
        }
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        global.token = ""
        global.hsToken = 0
        //SignUpViewController().nameTextField.text = ""
        let defaults = UserDefaults.standard
        defaults.set(global.token, forKey: "playerName")
        defaults.set(global.hsToken, forKey: "highScore")
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    func darkModeActions() {
        self.overrideUserInterfaceStyle = .dark
        tabBarController?.tabBar.barStyle = .black
        tabBarController?.overrideUserInterfaceStyle = .dark
        view.setNeedsDisplay()
        
    }

    func lightModeActions() {
        self.overrideUserInterfaceStyle = .light
        tabBarController?.overrideUserInterfaceStyle = .light
        tabBarController?.tabBar.barStyle = .default
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
