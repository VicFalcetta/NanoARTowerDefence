//
//  Score.swift
//  TowerDefenceAR
//
//  Created by Matheus Silva on 20/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class Score: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.textColor = UIColor.blue
        self.text = "SCORE: 00"
    }
    
    func addCount() {
        ScoreDefault.value += 1
        compareHighScore()
        self.text = "SCORE: \(getValue())"
    }
    
    func getValue() -> String {
        let value = ScoreDefault.value
        if (value < 10) {
            return "0\(value)"
        } else {
            return String(value)
        }
    }
    
    func compareHighScore() {
        if (HighScoreDefault.value < ScoreDefault.value) {
            HighScoreDefault.value = ScoreDefault.value
        }
    }
    func update() {
        self.text = "SCORE: \(getValue())"
    }
}
