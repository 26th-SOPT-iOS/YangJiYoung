//
//  ViewController.swift
//  iOS_Week2_assignment
//
//  Created by 양지영 on 2020/05/10.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

class SoptVC: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet var images: [UIImageView]!
    @IBOutlet weak var headerImageHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                setImagesLooksLike()
            }
            
            override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(true)
                
            }
            
            func setImagesLooksLike() {
                
                for i in 0..<images.count {
                    let _: UIImageView = {
                        let img = images[i]
                        img.layer.cornerRadius = 20
                        img.layer.borderWidth = 1
                        img.layer.borderColor = UIColor.white.cgColor
                        img.clipsToBounds = true
                        
                        return img
                    }()
                }
            }
        }


