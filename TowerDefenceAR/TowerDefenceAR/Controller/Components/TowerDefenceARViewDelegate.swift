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
    
    func config(towerARScene: TowerDefenceScene) {
        self.towerARScene = towerARScene
    }
    
    //MARK: - Funções Render
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let towerAnchor = anchor as? ARPlaneAnchor else { return }
        addTower(towerAnchor: towerAnchor, node: node)
    }
    
//    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
//
//    }
    
    //MARK: - Add Modelos
    func addTower(towerAnchor: ARPlaneAnchor, node: SCNNode) {
        var towerExists: Bool = false
        if (towerExists == false) {
            let tower = Tower()
            tower.loadModel()
            let posX = CGFloat(towerAnchor.center.x)
            let posY = CGFloat(towerAnchor.center.y)
            let posZ = CGFloat(towerAnchor.center.z)
            tower.position = SCNVector3(posX, posY, posZ)
            let ghost = Ghost()
            ghost.setupDeath(deathPosition: SCNVector3(posX, posY, posZ))
            node.addChildNode(ghost)
            node.addChildNode(tower)
            towerExists = true
        }
    }
    //Atualizar isso para usar o modelo da torre
    func updateTower(planeAnchor: ARPlaneAnchor, node: SCNNode) {
        guard let towerNode = node.childNodes.first, let tower = towerNode.geometry as? SCNPlane else { return }
        let width = CGFloat(0.3)
        let height = CGFloat(0.3)
        tower.width = width
        tower.height = height
        
        let posX = CGFloat(planeAnchor.center.x)
        let posY = CGFloat(planeAnchor.center.y)
        let posZ = CGFloat(planeAnchor.center.z)
        
        towerNode.position = SCNVector3(posX, posY, posZ)
    }
}
