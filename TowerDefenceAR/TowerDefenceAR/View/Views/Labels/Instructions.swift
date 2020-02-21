//
//  Instructions.swift
//  TowerDefenceAR
//
//  Created by Matheus Silva on 20/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class TitleInstruction: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        text = "YOU LOSE"
    }
}
class MessageInstruction: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        text = "The ghosts destroyed the tower. Try again."
    }
}

class ButtonInstruction: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setTitle("PLAY AGAIN", for: .normal)
    }
}

