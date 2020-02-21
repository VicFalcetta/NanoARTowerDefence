//
//  Lifes.swift
//  TowerDefenceAR
//
//  Created by Matheus Silva on 20/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class Lifes: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.textColor = UIColor.blue
        self.text = "LIFES: \(getValue())"
    }
    
    func demage() {
        LifesDefault.value -= 1
        self.text = "LIFES: \(getValue())"
    }
    
    func getValue() -> String {
        let value = LifesDefault.value
        if (value == 0) {
            EventManager.shared.trigger(eventName: "death")
            return "00"
        } else if (value < 10) {
            return "0\(value)"
        } else {
            return String(value)
        }
    }
    func update() {
        self.text = "LIFES: \(getValue())"
    }
}
