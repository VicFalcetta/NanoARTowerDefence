//
//  HighScore.swift
//  TowerDefenceAR
//
//  Created by Matheus Silva on 20/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class HighScore: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateValue()
    }
    
    func getValue() -> String {
        let value = HighScoreDefault.value
        if (value < 10) {
            return "0\(value)"
        } else {
            return String(value)
        }
    }
    
    func updateValue() {
        self.text = "HIGHSCORE \(getValue())"
    }
}
