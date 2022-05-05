//
//  AlbumViewController.swift
//  Music App
//
//  Created by Adilkhan Muratov on 05.05.2022.
//

import UIKit

class AlbumViewController: UIViewController {
    
    @IBOutlet weak var songsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songsTableView.delegate = self
        songsTableView.dataSource = self
        self.title = MainViewModel.vminstance.getAlbum()!.title
    }
    
    override func viewDidAppear(_ animated: Bool) {
        MainViewModel.vminstance.selectedSong = nil
    }
}

extension AlbumViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainViewModel.vminstance.getAlbum()!.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = songsTableView.dequeueReusableCell(withIdentifier: "SongTableViewCell", for: indexPath) as! SongTableViewCell
        
        cell.coverImageView.image = MainViewModel.vminstance.getAlbum()!.songs[indexPath.row].image
        cell.titleLabel.text = MainViewModel.vminstance.getAlbum()!.songs[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let songVC = self.storyboard?.instantiateViewController(withIdentifier: "SongVC") as! SongViewController
        MainViewModel.vminstance.selectSong(at: indexPath.row)
        navigationController?.pushViewController(songVC, animated: true)
    }
}
