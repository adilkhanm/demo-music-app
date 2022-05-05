//
//  Playlist.swift
//  Music App
//
//  Created by Adilkhan Muratov on 05.05.2022.
//

import Foundation
import UIKit

class Album {
    var title: String
    var image: UIImage
    var songs: [Song] = []
    
    init(title: String, image: UIImage, songs: [Song] = []) {
        self.title = title
        self.image = image
        self.songs = songs
    }
}

extension Album {
    static func get() -> [Album] {
        return [
            Album(title: "Imagine Dragons: Essentials", image: UIImage(named: "imagine-dragons-essentials")!, songs: [
                Song(name: "Bones", image: UIImage(named: "imagine-dragons-bones")!, artist: "Imagine Dragons", filename: "imagine-dragons-bones"),
                Song(name: "Believer", image: UIImage(named: "imagine-dragons-believer")!, artist: "Imagine Dragons", filename: "imagine-dragons-believer"),
                Song(name: "Radioactive", image: UIImage(named: "imagine-dragons-radioactive")!, artist: "Imagine Dragons", filename: "imagine-dragons-radioactive"),
                Song(name: "Thunder", image: UIImage(named: "imagine-dragons-thunder")!, artist: "Imagine Dragons", filename: "imagine-dragons-thunder")
            ]),
            Album(title: "Narrated for You", image: UIImage(named: "narrated-for-you")!, songs: [
                Song(name: "If We Have Each Other", image: UIImage(named: "if-we-have-each-other")!, artist: "Alec Benjamin", filename: "if-we-have-each-other"),
                Song(name: "Water Fountain", image: UIImage(named: "water-fountain")!, artist: "Alec Benjamin", filename: "water-fountain"),
                Song(name: "Annabelle's Homework", image: UIImage(named: "annabelle's-homework")!, artist: "Alec Benjamin", filename: "annabelle's-homework"),
            ]),
            Album(title: "dont smile at me", image: UIImage(named: "dont-smile-at-me")!, songs: [
                Song(name: "COPYCAT", image: UIImage(named: "copycat")!, artist: "Billie Eilish", filename: "copycat"),
                Song(name: "idontwannabeyouanymore", image: UIImage(named: "idontwannabeyouanymore")!, artist: "Billie Eilish", filename: "idontwannabeyouanymore"),
                Song(name: "my boy", image: UIImage(named: "my-boy")!, artist: "Billie Eilish", filename: "my-boy"),
                Song(name: "watch", image: UIImage(named: "watch")!, artist: "Billie Eilish", filename: "watch"),
                Song(name: "party favor", image: UIImage(named: "party-favor")!, artist: "Billie Eilish", filename: "party-favor"),
            ])
        ]
    }
}
