//
//  PlayerViewModel.swift
//  Music App
//
//  Created by Adilkhan Muratov on 05.05.2022.
//

import Foundation
import AVFAudio

class PlayerViewModel: NSObject {
    
    static var vminstance = PlayerViewModel()
    
    var player: AVAudioPlayer? = nil
    var song: Song? = nil {
        didSet {
            if song != nil {
                configure()
            } else {
                player?.stop()
                player = nil
            }
            isPlaying = false
        }
    }
    var isPlaying = false
    
    override init() {
        super.init()
    }
    
    func configure() {
        let filepath = Bundle.main.url(forResource: song!.filename, withExtension: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let filepath = filepath else {
                print("url is nil")
                return
            }
            
            print("\n\n filepath is \(filepath)\n\n")
            
            self.player = try AVAudioPlayer(contentsOf: filepath)
            
            guard self.player != nil else {
                print("\n\nplayer is nil\n\n")
                return
            }
            
            print("\n\nplayer is okay!\n\n")
            
        } catch {
            print("some error occured!")
        }
    }
    
    func play() {
        player?.play()
        isPlaying = true
    }
    
    func stop() {
        player?.stop()
        isPlaying = false
    }
}
