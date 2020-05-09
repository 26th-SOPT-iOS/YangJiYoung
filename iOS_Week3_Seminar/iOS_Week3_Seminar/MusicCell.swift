//
//  MusicCell.swift
//  iOS_Week3_Seminar
//
//  Created by 양지영 on 2020/05/09.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

class MusicCell: UICollectionViewCell {
    static let identifier: String = "MusicCell"
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    func set(_ musicInformation: Music) {
        albumImageView.image = musicInformation.albumImg
        singerLabel.text = musicInformation.singer
        titleLabel.text = musicInformation.musicTitle
    }
}
