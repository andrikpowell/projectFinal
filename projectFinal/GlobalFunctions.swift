//
//  globalFunctions.swift
//  projectFinal
//
//  Created by Andrik on 4/29/20.
//  Copyright © 2020 Powell, Andrik. All rights reserved.
//

import Foundation
import UIKit

/* FADE OPACITY CODE */
func setView(view: UIView, hidden: Bool) {
    UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
        view.isHidden = hidden
    })
}
