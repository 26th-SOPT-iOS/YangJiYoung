//
//  FriendViewController.swift
//  iOS_Week2_3_assignment
//
//  Created by 양지영 on 2020/05/15.
//  Copyright © 2020 양지영. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    static let identifier: String = "ProfileCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var friends: [Friends] = []
    func setFriendsList() {
        let friends1 = Friends(name: "지영", profileImage: "profile0Img", subTitle: "ㅠㅠ")
        let friends2 = Friends(name: "이솝트", profileImage: "profile1Img", subTitle: "뿌에엥")
        let friends3 = Friends(name: "박솝트", profileImage: "profile2Img", subTitle: "ㅜㅅㅜ")
        let friends4 = Friends(name: "김솝트", profileImage: "profile3Img", subTitle: "후엥")
        let friends5 = Friends(name: "강솝트", profileImage: "profile4Img", subTitle: "힝")
        let friends6 = Friends(name: "이솝트", profileImage: "profile5Img", subTitle: "")
        let friends7 = Friends(name: "박솝트", profileImage: "profile6Img", subTitle: "")
        let friends8 = Friends(name: "김솝트", profileImage: "profile7Img", subTitle: "")
        let friends9 = Friends(name: "강솝트", profileImage: "profile8Img", subTitle: "")
        let friends10 = Friends(name: "이솝트", profileImage: "profile9Img", subTitle: "")
        
        friends = [friends1, friends2, friends3, friends4, friends5, friends6, friends7, friends8, friends9, friends10]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        setFriendsList()
        setNavigationBar()
    }
    private func setNavigationBar() {
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        let longTitleLabel = UILabel()
        longTitleLabel.text = "친구"
        longTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        longTitleLabel.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        
        navigationItem.leftBarButtonItem = leftItem
    }
}

extension FriendViewController: UITableViewDelegate {
    // 내프로필==0, 친구프로필==1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 내프로필과 친구프로필 높이 다름
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 88
        } else {
            return 66
        }
    }
    
    // 섹션안의 로우 수, 내프로필은 1개, 친구프로필은 친구수-1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return friends.count-1
        }
    }
    
    // 친구프로필 위에 친구와 숫자 넣어줄 헤더
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 1
        } else {
            return 0
        }
    }
}
// MARK: - DataSource

extension FriendViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileCell  else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            cell.settings(friends[0])
            cell.profileImage.layer.cornerRadius = cell.profileImage.frame.height/2
            cell.underBar.alpha = 0

            return cell
        } else {
            cell.settings(friends[indexPath.item+1])
            cell.underBar.alpha = 0
            
            return cell
        }
    }
    
    // 친구프로필 섹션 헤더 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        
        let headerLabel = UILabel()
        let numberOfFriendLabel = UILabel()
        
        headerLabel.text = "친구 "
        headerLabel.font = UIFont.systemFont(ofSize: 12)
        headerLabel.frame = CGRect.init(x: 15, y: 0, width: 50, height: 30)
        
        numberOfFriendLabel.text = "\(friends.count-1)"
        numberOfFriendLabel.font = UIFont.systemFont(ofSize: 12)
        numberOfFriendLabel.frame = CGRect.init(x: 40, y: 0, width: 50, height: 30)
        
        view.addSubview(headerLabel)
        view.addSubview(numberOfFriendLabel)
        
        return view
    }
}

