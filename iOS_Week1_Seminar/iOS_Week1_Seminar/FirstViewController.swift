//
//  FirstViewController.swift
//  iOS_Week1_Seminar
//
//  Created by 양지영 on 2020/04/18.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sampleSwitch: UISwitch!
    @IBOutlet weak var sampleSlider: UISlider!
    @IBAction func transferData(_ sender: Any) {
        guard let receiveViewController =
            self.storyboard?.instantiateViewController(identifier:
                "secondViewController") as? SecondViewController else {return}
        
        receiveViewController.name = nameTextField.text
        receiveViewController.email = emailTextField.text
        receiveViewController.isOnOff = sampleSwitch.isOn
        receiveViewController.frequency = sampleSlider.value
        self.present(receiveViewController, animated: true, completion: nil)
    }
}
