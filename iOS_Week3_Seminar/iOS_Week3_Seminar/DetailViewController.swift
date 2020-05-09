//
//  DetailViewController.swift
//  iOS_Week3_Seminar
//
//  Created by 양지영 on 2020/05/09.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var imageName: String = ""
    var date: String = ""
    var subTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
    }

    private func initView(){
        weatherImageView.image = UIImage(named: imageName)
        dateLabel.text = date
        subTitleLabel.text = subTitle
    }
}
