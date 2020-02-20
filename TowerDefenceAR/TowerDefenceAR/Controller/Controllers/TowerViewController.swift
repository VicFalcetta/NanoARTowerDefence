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
    @IBOutlet var scoreLabel: Score!
    @IBOutlet var highScoreLabel: HighScore!
    @IBOutlet weak var scoreView: UIVisualEffectView!
    @IBOutlet weak var highScoreView: UIVisualEffectView!
    @IBOutlet weak var messageView: UIVisualEffectView!
    
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
        sceneView.config(viewController: self)
        sceneView.debug()
    }
    
    func addScore() {
        scoreLabel.addCount()
        highScoreLabel.updateValue()
    }
    
    func disable() {
        scoreView.isHidden = true
        highScoreView.isHidden = true
        messageView.isHidden = true
    }
    
    func enable() {
        scoreView.isHidden = false
        highScoreView.isHidden = false
    }
    
    @IBAction func reset(_ sender: Any) {
        sceneView.reset()
    }
}
