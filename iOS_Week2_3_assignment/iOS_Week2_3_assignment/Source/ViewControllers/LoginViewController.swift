//
//  LoginViewController.swift
//  iOS_Week2_assignment
//
//  Created by 양지영 on 2020/05/10.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var txtFields: [UITextField]!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setButtonsLooksLike()
        setNavigationBarLooksLike()
    }
    
//    @IBAction func loginButton(_ sender: Any) {
//        guard let viewcontroller = storyboard?.instantiateViewController(withIdentifier: "TabbarController") else {
//            return
//        }
//
//        viewcontroller.modalPresentationStyle = .currentContext
//        present(viewcontroller, animated: true)
//    }
    
    @IBAction func login(_ sender: Any) {
        guard let inputID = txtFields[0].text else { return }
        guard let inputPWD = txtFields[1].text else { return }
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
        "TabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
        self.present(tabbarController, animated: true, completion: nil)
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
        case .pathErr: print("path")
        case .serverErr: print("serverErr") case .networkFail: print("networkFail") }
        }
    }
    
    @IBAction func signupButton(_ sender: Any) {
        guard let viewcontroller = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") else {
                    return
                }
        
        viewcontroller.modalPresentationStyle = .currentContext
                present(viewcontroller, animated: true)
    }
    
 
    
    func setNavigationBarLooksLike(){
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
    }
    func  setButtonsLooksLike()  {
        
        for i in 0..<txtFields.count {
            txtFields[i].backgroundColor = UIColor.calculatorColor(.signUpAndInColor)
            txtFields[i].layer.cornerRadius = 20
            txtFields[i].layer.borderWidth = 1
            txtFields[i].layer.borderColor = UIColor.white.cgColor
            txtFields[i].clipsToBounds = true
            txtFields[0].placeholder = "   아이디"
            txtFields[1].placeholder = "   비밀번호"
            txtFields[1].isSecureTextEntry = true
        }
                
            loginButton.layer.cornerRadius = 20
            loginButton.layer.borderWidth = 1
            loginButton.layer.borderColor = UIColor.white.cgColor
            loginButton.clipsToBounds = true
            loginButton.layer.backgroundColor = UIColor.calculatorColor(.soptColor).cgColor
            loginButton.setTitle("로그인", for: .normal)
            loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            loginButton.setTitleColor(.white, for: .normal)
        }
}
