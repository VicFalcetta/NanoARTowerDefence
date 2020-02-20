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
    var towerExists: Bool = false
    
    func config(towerARScene: TowerDefenceScene) {
        self.towerARScene = towerARScene
    }
    
    //MARK: - Funções Render
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let towerAnchor = anchor as? ARPlaneAnchor else { return }
        addTower(towerAnchor: towerAnchor, node: node, towerExists: towerExists)
    }
    
//    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
//
//    }
    
    //MARK: - Add Modelos
    func addTower(towerAnchor: ARPlaneAnchor, node: SCNNode, towerExists: Bool) {
        if (towerExists == false) {
            let tower = Tower()
            tower.loadModel()
            let posX = CGFloat(towerAnchor.center.x)
            let posY = CGFloat(towerAnchor.center.y)
            let posZ = CGFloat(towerAnchor.center.z)
            tower.position = SCNVector3(posX, posY, posZ)
            
            towerARScene?.addGhost(withParent: tower)
            node.addChildNode(tower)
            self.towerExists = true
        }
    }
    //Atualizar isso para usar o modelo da torre
    func updateTower(planeAnchor: ARPlaneAnchor, node: SCNNode) {
        
    }
}
