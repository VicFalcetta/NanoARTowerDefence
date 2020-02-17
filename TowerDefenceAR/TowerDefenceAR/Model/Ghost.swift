//
//  Ghost.swift
//  TowerDefenceAR
//
//  Created by Victor Falcetta do Nascimento on 14/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import SceneKit

class Ghost: SCNNode {
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadModel() {
        let nodeGhost = SCNReferenceNode(named: "ghost")
        addChildNode(nodeGhost)
    }
    
    func setupPos() {
        position = SCNVector3(10, 10, 10)
    }
    
    func setupDeath() {
        let initialPos = SCNVector3(0, 0, 0)
        let actionMovement = SCNAction.move(to: initialPos, duration: 30)
        let actionRemove = SCNAction.removeFromParentNode()
        let sequence = SCNAction.sequence([actionMovement, actionRemove])
        runAction(sequence)
    }
}
