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
    let towerDelegate = TowerDefenceARViewDelegate()
    
    func setupScene() {
        
    }
    
    func configScene() {
        let scene = SCNScene(named: "art.scnassets/scene.scn")!
        self.scene = scene
    }
    
    func configDelegate() {
        delegate = towerDelegate
        towerDelegate.initialSetup(towerARScene: self)
    }
    
    func debug() {
        showsStatistics = true
        debugOptions = [.showFeaturePoints]
    }
    
    func automaticallyLight() {
        autoenablesDefaultLighting = true
        automaticallyUpdatesLighting = true
    }
    
    // MARK: - Addition of Nodes
    
    func addGhost() {
        let ghost = Ghost()
        scene.rootNode.addChildNode(ghost)
    }
    
    func removeGhost() {
        if let ghost = scene.rootNode.childNode(withName: "ghost", recursively: false) {
            ghost.removeFromParentNode()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first,
            let hitTestTouch = hitTest(touch.location(in: self),
                                       types: .existingPlaneUsingExtent).first {
            let local = touch.location(in: self)
            let objTouched = hitTest(local, options: nil)
            
            //set Anchor
            let anchor = ARAnchor(transform: hitTestTouch.worldTransform)
            session.add(anchor: anchor)
            if let ghostTouched = objTouched.first {
                let ghost = ghostTouched.node
                for i in 0...4 {
                    
                    
                }
            }
        }
    }
    
}
