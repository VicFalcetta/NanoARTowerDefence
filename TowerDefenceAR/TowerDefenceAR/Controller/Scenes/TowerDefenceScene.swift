//
//  TowerDefenceScene.swift
//  TowerDefenceAR
//
//  Created by Victor Falcetta do Nascimento on 14/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import SceneKit
import ARKit

class TowerDefenceScene: ARSCNView {
    let coach = Coaching()
    let towerDelegate = TowerDefenceARViewDelegate()
    
    func config() {
        //coach.setup(sceneView: self)
        //coach.addCoaching()
        configDelegate()
        configScene()
        automaticallyLight()
    }
    
    func configScene() {
        let scene = SCNScene(named: "art.scnassets/scene.scn")!
        self.scene = scene
    }
    
    func configDelegate() {
        delegate = towerDelegate
        towerDelegate.config(towerARScene: self)
    }
    
    func debug() {
        showsStatistics = true
        debugOptions = [.showFeaturePoints]
    }
    
    func automaticallyLight() {
        autoenablesDefaultLighting = true
        automaticallyUpdatesLighting = true
    }
    
    func reset() {
        session.pause()
        if let configuration = session.configuration {
            session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
            towerDelegate.towerExists = false
        }
    }
    
    // MARK: - Addition of Nodes
    
    func addGhost(node: SCNNode) {
        let ghost = Ghost()
        ghost.setupDeath(deathPosition: node.position)
        node.addChildNode(ghost)
    }
    
    func updateGhost(deathposition: SCNVector3) {
        if let ghost = scene.rootNode.childNode(withName: "ghost", recursively: false) {
            ghost.removeFromParentNode()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let currentTouchLocation = touches.first?.location(in: self),
        let hitTestNode = hitTest(currentTouchLocation, options: nil).first?.node
        else { return }
        if let ghost = hitTestNode.parent?.parent as? Ghost, let parent = ghost.parent {
            ghost.respawn(withParent: parent)
            ImpactFeedback.shared.generateHeavy()
        }
        
    }
}
