//
//  ViewController.swift
//  Music App
//
//  Created by Adilkhan Muratov on 05.05.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var albumsCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        albumsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "AlbumCollectionViewCell")
        
        albumsCollectionView.dataSource = self
        albumsCollectionView.delegate = self
        albumsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        MainViewModel.vminstance.selectedAlbum = nil
        MainViewModel.vminstance.selectedSong = nil
    }

}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MainViewModel.vminstance.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumsCollectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as! AlbumCollectionViewCell
        
        cell.coverImageView.image = MainViewModel.vminstance.albums[indexPath.item].image
//        cell.coverImageView.contentMode = UIView.ContentMode.scaleAspectFit
//        cell.coverImageView.layer.masksToBounds = true
        
        cell.titleLabel.text = MainViewModel.vminstance.albums[indexPath.item].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let albumVC = self.storyboard?.instantiateViewController(withIdentifier: "AlbumVC") as! AlbumViewController
        MainViewModel.vminstance.selectAlbum(at: indexPath.item)

        navigationController?.pushViewController(albumVC, animated: true)
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = min(UIScreen.main.bounds.width / 2 - 20, 200)
        let height = width + 70
        return CGSize(width: width, height: height)
    }
}

