//
//  SongTableViewCell.swift
//  Music App
//
//  Created by Adilkhan Muratov on 05.05.2022.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
