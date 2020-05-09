//
//  Music.swift
//  iOS_Week3_Seminar
//
//  Created by 양지영 on 2020/05/09.
//  Copyright © 2020 양지영. All rights reserved.
//
import UIKit

// Music 모델
struct Music {
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(coverName: String, singer: String, title: String) {
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = title
        self.singer = singer
    }
    
}
