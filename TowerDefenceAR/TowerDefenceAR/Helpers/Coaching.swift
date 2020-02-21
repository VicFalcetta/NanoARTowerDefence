//
//  Couching.swift
//  coaching
//
//  Created by Matheus Silva on 14/02/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//
import ARKit

class Coaching: ARCoachingOverlayView, ARCoachingOverlayViewDelegate {
    
    private weak var sceneView: TowerDefenceScene!
    
    func setup(sceneView: TowerDefenceScene) {
        self.sceneView = sceneView
    }
    
    func addCoaching() {
        // Make sure it rescales if the device orientation changes
        autoresizingMask = [
            .flexibleWidth, .flexibleHeight
        ]
        
        // Set the ARSession
        session = sceneView.session
        // Set the delegate for any callbacks
        delegate = self
        
        setActivatesAutomatically()
        // Most of the virtual objects in this sample require a horizontal surface,
        // therefore coach the user to find a horizontal plane.
        setGoal(goal: .horizontalPlane)
        
        sceneView.addSubview(self)
        setupCenter()
    }
    
    private func setupCenter() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: sceneView.centerXAnchor),
            centerYAnchor.constraint(equalTo: sceneView.centerYAnchor),
            widthAnchor.constraint(equalTo: sceneView.widthAnchor),
            heightAnchor.constraint(equalTo: sceneView.heightAnchor)
        ])
    }
    
    /// - Tag: CoachingActivatesAutomatically
    private func setActivatesAutomatically() {
        activatesAutomatically = true
    }

    /// - Tag: CoachingGoal
    private func setGoal(goal: ARCoachingOverlayView.Goal) {
        self.goal = goal
    }
    
    // MARK: - Callbacks
    /// - Tag: Coaching Activate
    func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
        sceneView.disableScreen()
        MusicHandler.ambient_sound?.pause()
    }

    /// - Tag: Coaching Deactivate
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        sceneView.enableScreen()
        MusicHandler.ambient_sound?.play()
    }

    /// - Tag: Coaching SessionReset
    func coachingOverlayViewDidRequestSessionReset(_ coachingOverlayView: ARCoachingOverlayView) {
        
    }
}
