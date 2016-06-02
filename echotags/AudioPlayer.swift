//
//  Audio.swift
//  echotags
//
//  Created by bkzl on 01/06/16.
//  Copyright © 2016 bkzl. All rights reserved.
//

import UIKit
import AVFoundation

class AudioPlayer: NSObject {
    var player: AVAudioPlayer?
    
    func play(recording: String) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { [weak weakSelf = self] in
            if let sound = NSDataAsset(name: recording) {
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, withOptions: [.DuckOthers, .InterruptSpokenAudioAndMixWithOthers])
                    try AVAudioSession.sharedInstance().setActive(true)
                    
                    try weakSelf?.player = AVAudioPlayer(data: sound.data, fileTypeHint: AVFileTypeAppleM4A)
                    weakSelf?.player?.delegate = self
                    weakSelf?.player?.play()
                } catch {
                    print(error)
                }
            }
        }
    }
}

extension AudioPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
            do {
                try AVAudioSession.sharedInstance().setActive(false)
            } catch {
                print(error)
            }
        }
    }
}