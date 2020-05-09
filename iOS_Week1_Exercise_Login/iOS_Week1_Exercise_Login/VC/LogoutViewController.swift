//
//  LogoutViewController.swift
//  iOS_Week1_Exercise_Login
//
//  Created by 양지영 on 2020/04/18.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
    }
    
    
    @IBOutlet weak var idLabel: UITextField!
    @IBOutlet weak var pwdLabel: UITextField!
   
    
    
    var id: String?
    var pwd: String?
    
    private func setLabels(){
        // 옵셔널 바인딩
        guard let id = self.id else {return}
        guard let pwd = self.pwd else {return}
        
        // label에 값 대입
        idLabel.text = id
        pwdLabel.text = pwd
    }
    // 로그아웃버튼
    @IBAction func logoutView(_ sender: Any) {
        
        dismiss(animated: true) {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                (appDelegate.window?.rootViewController as? UINavigationController)?.popViewController(animated: true)
                }
            }
        }
        


}
