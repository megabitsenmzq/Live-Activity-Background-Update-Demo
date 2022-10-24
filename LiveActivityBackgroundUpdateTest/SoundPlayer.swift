//
//  SoundPlayer.swift
//  LiveActivityBackgroundUpdateTest
//
//  Created by Jinyu Meng on 2022/10/24.
//

import Foundation
import AVFoundation
import ActivityKit

class SoundPlayer: NSObject {
    static let shared = SoundPlayer()
    let session = AVAudioSession.sharedInstance()
    let playQueue = DispatchQueue(label: "com.soundPlayer.playQueue", qos: .userInitiated)
    var testSoundPlayer: AVAudioPlayer!
    
    var soundPath: String { Bundle.main.path(forResource: "sound", ofType: "m4a")! }
    var soundURL: URL { URL(fileURLWithPath: soundPath) }
    
    var soundTimer: Timer?
    var timer: Timer?
    
    var value = 0
    
    override init() {
        super.init()
        do {
            try session.setCategory(.playback, mode: .default, options: .mixWithOthers)
            try session.setActive(true)
        } catch {
            print(error)
        }
        
        do {
            testSoundPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error)
        }
        
        let attributes = TestAttributes()
        let state = TestAttributes.ContentState(value: value)
        
        do {
            let runningActivity = try Activity<TestAttributes>.request(attributes: attributes, contentState: state)
            print(runningActivity.id)
        } catch {
            print(error)
        }
        
        soundTimer = Timer(timeInterval: 30, repeats: true, block: { [weak self] (timer) in
            guard let self = self else { return }
            self.testSoundPlayer.play()
        })
        RunLoop.main.add(soundTimer!, forMode: .common)
        
        
        timer = Timer(timeInterval: 1, repeats: true, block: { [weak self] (timer) in
            guard let self = self else { return }
            
            self.value += 1
            let state = TestAttributes.ContentState(value: self.value)
            Task { @MainActor in
                let activity = Activity<TestAttributes>.activities.first
                await activity?.update(using: state)
            }
        })
        
        RunLoop.main.add(timer!, forMode: .common)
    }
}
