//
//  Friends.swift
//  iOS_Week2_3_assignment
//
//  Created by 양지영 on 2020/05/15.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

struct Friends {
    
    var name: String
    var profileImage: UIImage?
    var subTitle: String
    
    init(name: String, profileImage: String, subTitle: String) {
        self.name = name
        self.profileImage = UIImage(named: profileImage)
        self.subTitle = subTitle
    }
}
