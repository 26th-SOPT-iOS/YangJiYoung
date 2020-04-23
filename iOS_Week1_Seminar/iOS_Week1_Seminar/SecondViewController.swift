//
//  SecondViewController.swift
//  iOS_Week1_Seminar
//
//  Created by 양지영 on 2020/04/18.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLabels()
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    
    @IBAction func backScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var name: String?
    var email: String?
    var isOnOff: Bool?
    var frequency: Float?
    
    private func setLabels() {
        guard let name = self.name else {return}
        guard let email = self.email else {return}
        guard let isOnOff = self.isOnOff else {return}
        guard let frequency = self.frequency else {return}
        
        nameLabel.text = name
        emailLabel.text = email
        switchLabel.text = isOnOff ? "On" : "Off"
        frequencyLabel.text = "\(frequency)"
        
    }
}
