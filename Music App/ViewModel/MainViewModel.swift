//
//  MainModelView.swift
//  Music App
//
//  Created by Adilkhan Muratov on 05.05.2022.
//

import Foundation

class MainViewModel: NSObject {
    
    static var vminstance = MainViewModel()
    
    private(set) var albums = [Album]()
    
    var selectedAlbum: Int? = nil
    var selectedSong: Int? = nil {
        didSet {
            PlayerViewModel.vminstance.song = self.getSong()
        }
    }
    
    override init() {
        super.init()
        fetchAlbums()
    }
    
    private func fetchAlbums() {
        albums = Album.get()
    }
    
    func selectAlbum(at position: Int) {
        if 0 <= position && position < albums.count {
            self.selectedAlbum = position
        }
    }
    
    func selectSong(at position: Int) {
        if let albumPosition = selectedAlbum {
            if 0 <= position && position < albums[albumPosition].songs.count {
                selectedSong = position
            }
        }
    }
    
    func getAlbum() -> Album? {
        if let selectedAlbum = selectedAlbum {
            return albums[selectedAlbum]
        } else {
            return nil
        }
    }
    
    func getSong() -> Song? {
        if let selectedAlbum = selectedAlbum, let selectedSong = selectedSong {
            return albums[selectedAlbum].songs[selectedSong]
        } else {
            return nil
        }
    }
    
    func nextSong(offset: Int) {
        if let selectedSong = selectedSong {
            self.selectedSong = (selectedSong + offset + self.getAlbum()!.songs.count) % self.getAlbum()!.songs.count
        }
    }
}
