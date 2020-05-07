//
//  AppDelegate.swift
//  projectFinal
//
//  Created by Powell, Andrik on 2/24/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        let defaults = UserDefaults.standard
        let defaultValue = ["playerName" : " "]
        let defaultScore = ["highScore" : 0 ]
        let defaultScoreNumber = ["highScoreNumber" : 0 ]
        let defaultScoreCorrect = ["highScoreCorrect" : 0 ]
        let defaultScoreWrong = ["highScoreWrong" : 0 ]
        let defaultScoreTypeP = ["highScoreTypeP" : 0 ]
        let defaultScoreTypePK = ["highScoreTypePK" : 0 ]
        let defaultScoreTypeB = ["highScoreTypeB" : 0 ]
        let defaultScoreTypeS = ["highScoreTypeS" : 0 ]
        let defaultScoreTypeC = ["highScoreTypeC" : 0 ]
        let defaultDarkMode = ["darkMode" : false ]
        defaults.register(defaults: defaultValue)
        defaults.register(defaults: defaultScore)
        defaults.register(defaults: defaultScoreNumber)
        defaults.register(defaults: defaultScoreCorrect)
        defaults.register(defaults: defaultScoreWrong)
        defaults.register(defaults: defaultScoreTypeC)
        defaults.register(defaults: defaultScoreTypeS)
        defaults.register(defaults: defaultScoreTypeB)
        defaults.register(defaults: defaultScoreTypeP)
        defaults.register(defaults: defaultScoreTypePK)
        defaults.register(defaults: defaultDarkMode)

        /*
        let hsDefaults = UserDefaults.standard
        let hsDefaultValue = ["highScore" : 30]
        hsDefaults.register(defaults: hsDefaultValue)
        */

    }


}

