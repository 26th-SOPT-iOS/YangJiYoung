//
//  SignUpVC.swift
//  iOS_Week2_3_assignment
//
//  Created by 양지영 on 2020/05/22.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet var txtFields: [UITextField]!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layerSettins()
        setNavigationBarLooksLike()
    }
    
    @IBAction func sendNextVC(_ sender: Any) {
        guard let inputID = txtFields[0].text else {return}
        guard let inputPWD = txtFields[1].text else {return}
        guard let inputName = txtFields[2].text else {return}
        guard let inputEmail = txtFields[3].text else {return}
        guard let inputPhone = txtFields[4].text else {return}
        
        SignupService.shared.signup(id: inputID, pwd: inputPWD, name: inputName, email: inputEmail, phone: inputPhone) {
            networkResult in
            switch networkResult{
            case .success:
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "TabbarController") as? UITabBarController else {return}
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else {return}
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkfail")
                
            }
        }
    }
    
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
               txtFields[4].placeholder = "  휴대폰번호"
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
    
    @objc func dismissVC() {
        self.navigationController?.popViewController(animated: true)
    }
}

