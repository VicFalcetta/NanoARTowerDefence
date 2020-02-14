//
//  ImpactFeedback.swift
//  TowerDefenceAR
//
//  Created by Victor Falcetta do Nascimento on 14/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class ImpactFeedback {
    private init () { }
    static let shared = ImpactFeedback()
    
    func generateHeavy() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }
    
    func generateMedium() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    func generateLight() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    
    func generateError() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
    
    func generateSuccess() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
    
    func generateWarning() {
        UINotificationFeedbackGenerator().notificationOccurred(.warning)
    }
}
