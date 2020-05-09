//
//  ViewController.swift
//  iOS_Week1_Exercise_Login
//
//  Created by 양지영 on 2020/04/18.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

//회원가입 화면
class SignUpViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func signUpData(_ sender: Any) {
        guard let recieveViewController = self.storyboard?.instantiateViewController(identifier: "LogoutViewController") as? LogoutViewController else {return}
        
        self.present(recieveViewController, animated: true, completion: nil)
  
    }
    
}

