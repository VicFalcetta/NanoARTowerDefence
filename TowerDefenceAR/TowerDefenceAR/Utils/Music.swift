//
//  Music.swift
//  TowerDefenceAR
//
//  Created by Matheus Silva on 20/02/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import AVFoundation

enum MusicLoadResponse: Error {
    case success(audio: AVAudioPlayer)
    case error(description: String)
}

struct MusicHandler {
    static func get(withName name: String, withCompletion completion: (MusicLoadResponse) -> Void) {
        guard let path = Bundle.main.path(forResource: name, ofType: nil) else {
            completion(MusicLoadResponse.error(description: "Music not found"))
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let audio = try AVAudioPlayer(contentsOf: url)
            completion(MusicLoadResponse.success(audio: audio))
        } catch {
            completion(MusicLoadResponse.error(description: "Music can't convert"))
        }
    }
}
