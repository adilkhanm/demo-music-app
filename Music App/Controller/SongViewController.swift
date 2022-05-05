//
//  SongViewController.swift
//  Music App
//
//  Created by Adilkhan Muratov on 05.05.2022.
//

import UIKit
import AVFoundation

class SongViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
    }
    
    private func prepare() {
        coverImageView.image = MainViewModel.vminstance.getSong()!.image
        titleLabel.text = MainViewModel.vminstance.getSong()!.name
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
    
    @IBAction func backButtonDidTap(_ sender: UIButton) {
        MainViewModel.vminstance.nextSong(offset: -1)
        prepare()
        print("selected song: \(MainViewModel.vminstance.selectedSong!)")
    }
    
    @IBAction func forwardButtonDidTap(_ sender: UIButton) {
        MainViewModel.vminstance.nextSong(offset: 1)
        prepare()
    }
    
    @IBAction func playButtonDidTap(_ sender: UIButton) {
        if PlayerViewModel.vminstance.isPlaying == false {
            PlayerViewModel.vminstance.play()
            sender.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        } else {
            PlayerViewModel.vminstance.stop()
            sender.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    
}
