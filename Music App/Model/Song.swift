//
//  Song.swift
//  Music App
//
//  Created by Adilkhan Muratov on 05.05.2022.
//

import Foundation
import UIKit

class Song {
    var name: String
    var image: UIImage
    var artist: String
    var filename: String
    
    init(name: String, image: UIImage, artist: String, filename: String) {
        self.name = name
        self.image = image
        self.artist = artist
        self.filename = filename
    }
}
