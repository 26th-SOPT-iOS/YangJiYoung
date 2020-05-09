//
//  LoginViewController.swift
//  iOS_Week1_Exercise_Login
//
//  Created by 양지영 on 2020/04/18.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
   
    // 회원가입버튼
    @IBAction func signupPage(_ sender: Any) {
        guard  let receiveViewController = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController else {return}
               
               self.present(receiveViewController, animated: true, completion: nil)
    }
    
    // 로그인버튼
    @IBAction func transferData(_ sender: Any) {
        // 다음 화면을 회원가입뷰로 넘김
        guard  let receiveViewController = self.storyboard?.instantiateViewController(identifier: "LogoutViewController") as? LogoutViewController else {return}
        
        receiveViewController.id = idTextField.text
        receiveViewController.pwd = pwdTextField.text
        // 객체가 만들어져야 넘어가기 때문에 세그먼트 연결 끊어줘야함
        self.present(receiveViewController, animated: true, completion: nil)
    }
    
    
}
