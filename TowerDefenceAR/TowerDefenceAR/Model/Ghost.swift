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
        loadModel()
        setupPos()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadModel() {
        //Adicionando o modelo customizado
        let nodeContainer = SCNNode()
        guard let nodeGhost = SCNScene(named: "art.scnassets/ghost_.scn") else { return }
        for child in nodeGhost.rootNode.childNodes {
            nodeContainer.addChildNode(child)
        }
        nodeContainer.pivot = SCNMatrix4Rotate(nodeContainer.pivot, .pi, 0, 1, 0)
        addChildNode(nodeContainer)
        
    }
    
    func setupPos() {
        let maximo: Float = 5.0
        let minimo: Float = -5.0
        
        let posX = Float.random(in: minimo...maximo)
        let posY = Float.random(in: 0...maximo)
        let posZ = Float.random(in: minimo...maximo)
        
        position = SCNVector3(posX, posY, posZ)
    }
    
    func lookAt(lookTarget: SCNNode) {
        let lookAtConstraints = SCNLookAtConstraint(target: lookTarget)
        constraints = [lookAtConstraints]
        
    }
    
    func setupDeath(deathPosition: SCNVector3) {
        let actionMovement = SCNAction.move(to: deathPosition, duration: 15)
        let addAction = SCNAction.run({ _ in
            if let parent = self.parent {
                if let copy = self.copy() as? Ghost {
                    copy.respawn(withParent: parent)
                    EventManager.shared.trigger(eventName: "demage")
                }
            }
        })
        let actionRemove = SCNAction.removeFromParentNode()
        let sequence = SCNAction.sequence([actionMovement, addAction, actionRemove])
        runAction(sequence)
    }
    
    func respawn(withParent parent: SCNNode) {
        removeAllActions()
        setupPos()
        lookAt(lookTarget: parent)
        setupDeath(deathPosition: parent.position)
        parent.addChildNode(self)
    }
}
