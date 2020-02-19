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
        addChildNode(nodeContainer)

        //Adicionando com a extension
//        let nodeGhost = SCNReferenceNode(named: "ghost")
//        addChildNode(nodeGhost)
        
//        Teste com caixa
//        let ghost = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.0)
//        let ghostNode = SCNNode(geometry: ghost)
//        addChildNode(ghostNode)
        
    }
    
    func setupPos() {
        let maximo: Float = 5.0
        let minimo: Float = 0.0
        
        let posX = Float.random(in: minimo...maximo)
        let posY = Float.random(in: minimo...maximo)
        let posZ = Float.random(in: minimo...maximo)
        
        position = SCNVector3(posX, posY, posZ)
    }
    
    func setupDeath(deathPosition: SCNVector3) {
        let actionMovement = SCNAction.move(to: deathPosition, duration: 10)
        let addAction = SCNAction.run({ _ in
            if let parent = self.parent {
                if let copy = self.copy() as? Ghost {
                    copy.respawn(withParent: parent)
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
        setupDeath(deathPosition: parent.position)
        parent.addChildNode(self)
    }
}
