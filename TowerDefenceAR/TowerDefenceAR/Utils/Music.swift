//
//  Music.swift
//  TowerDefenceAR
//
//  Created by Matheus Silva on 20/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import AVFoundation

struct MusicHandler {
    static var ambient_sound: AVAudioPlayer?
    static var ghost_scream: AVAudioPlayer?
    
    static func loadAmbientSound() {
        MusicHandler.ambient_sound = MusicHandler.load(withName: "ambient_sound.mp3")
        MusicHandler.ambient_sound?.play()
    }
    static func loadGhostScream() {
        MusicHandler.ghost_scream = MusicHandler.load(withName: "ghost_scream.mp3")
    }
    static func load(withName name: String) -> AVAudioPlayer? {
        guard let path = Bundle.main.path(forResource: name, ofType: nil) else {
            NSLog("Music not found")
            return nil
        }
        let url = URL(fileURLWithPath: path)
        do {
            let audio = try AVAudioPlayer(contentsOf: url)
            return audio
        } catch {
            NSLog("Music can't convert")
            return nil
        }
    }
}
