//
//  Tower.swift
//  TowerDefenceAR
//
//  Created by Victor Falcetta do Nascimento on 14/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import SceneKit

class Tower: SCNNode {
    override init() {
        super.init()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadModel() {
        let nodeContainer = SCNNode()
        guard let towerNode = SCNScene(named: "art.scnassets/tower_.scn") else { return }
        for child in towerNode.rootNode.childNodes {
            nodeContainer.addChildNode(child)
        }
        addChildNode(nodeContainer)
    }
}
