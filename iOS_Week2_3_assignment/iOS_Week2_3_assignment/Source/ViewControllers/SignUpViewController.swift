//
//  SignUpViewController.swift
//  iOS_Week2_3_assignment
//
//  Created by 양지영 on 2020/05/15.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var txtFields: [UITextField]!
    
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 회원가입 후 전화면으로 돌아가기
   @IBAction func sendNextVC(_ sender: Any) {
       
       guard let viewcontroller = storyboard?.instantiateViewController(identifier: "LoginViewController") else { return }
       
       viewcontroller.modalPresentationStyle = .fullScreen
       present(viewcontroller, animated: true)
       
   }
   
   //MARK:- UI Logic
   
   func layerSettins() {
       
       for i in 0..<txtFields.count {
           txtFields[i].backgroundColor = UIColor.calculatorColor(.signUpAndInColor)
           txtFields[i].layer.cornerRadius = 20
           txtFields[i].layer.borderWidth = 1
           txtFields[i].layer.borderColor = UIColor.white.cgColor
           txtFields[i].clipsToBounds = true
           txtFields[0].placeholder = "  아이디"
           txtFields[1].placeholder = "  비밀번호"
           txtFields[2].placeholder = "  이름"
           txtFields[3].placeholder = "  이메일"
           txtFields[4].placeholder = "  휴대폰 번호"
       }
       signUpButton.layer.cornerRadius = 20
       signUpButton.layer.borderWidth = 1
       signUpButton.layer.borderColor = UIColor.white.cgColor
       signUpButton.clipsToBounds = true
       signUpButton.layer.backgroundColor = UIColor.calculatorColor(.soptColor).cgColor
       signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
       signUpButton.setTitle("가입완료", for: .normal)
       signUpButton.setTitleColor(.white, for: .normal)
       
   }
   
   func setNavigationBarLooksLike() {
       guard let navigationBar = self.navigationController?.navigationBar else { return }
       
       let backIndicator: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "backIndicator"), style: .plain, target: self, action: #selector(dismissVC))
       
       navigationBar.isTranslucent = false
       navigationBar.backgroundColor = UIColor.clear
       navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
       navigationBar.shadowImage = UIImage()
       
       navigationItem.leftBarButtonItem = backIndicator
       
   }
   // 뒤로가기
   @objc func dismissVC() {
       self.navigationController?.popViewController(animated: true)
   }
}
