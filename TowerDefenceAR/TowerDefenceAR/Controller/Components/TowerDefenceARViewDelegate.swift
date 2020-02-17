//
//  TowerDefenceARViewDelegate.swift
//  TowerDefenceAR
//
//  Created by Victor Falcetta do Nascimento on 14/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import SceneKit
import ARKit

class TowerDefenceARViewDelegate: NSObject, ARSCNViewDelegate {
    weak var towerARScene: TowerDefenceScene?
    
    func initialSetup(towerARScene: TowerDefenceScene) {
        self.towerARScene = towerARScene
    }
    
    //MARK: - Funções Render
//    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
//
//    }
    
//    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
//
//    }
    
}
