//
//  ViewController.swift
//  TowerDefenceAR
//
//  Created by Victor Falcetta do Nascimento on 14/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class TowerViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: TowerDefenceScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    //MARK: - Setup da controler
    func config() {
        configScene()
    }
    
    func configScene() {
        sceneView.config()
        sceneView.debug()
    }
    @IBAction func reset(_ sender: Any) {
        sceneView.reset()
    }
}
