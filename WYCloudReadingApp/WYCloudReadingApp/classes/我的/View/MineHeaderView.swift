//
//  MineHeaderView.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/7.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class MineHeaderView: UIView {
    
    /* 头像 */
    @IBOutlet weak var headImgView: UIImageView!
    
    /* 点击登陆label */
    @IBOutlet weak var loginBtn: UIButton!
    
    /* 信息view */
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var levelLB: UILabel!
    @IBOutlet weak var levelLB_constraintWidth: NSLayoutConstraint!
    
    /* 编辑view */
    @IBOutlet weak var editView: UIView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    
    //MARK: - 点击事件
    /* 个人信息 */
    @IBAction func userDataTapClickFunc(_ sender: UITapGestureRecognizer) {
        if UserDefaults.standard.value(forKey: "login") as? Bool ?? false {
            // 跳转个人信息界面
            
        }
    }
    
    /* 编辑信息 */
    @IBAction func editTapClickFunc(_ sender: UITapGestureRecognizer) {
        guard let viewC : UIViewController = self.firstViewController() else {
            return
        }
        let editVC = UIStoryboard(name: "Mine", bundle: nil).instantiateViewController(withIdentifier: "editUserInfoVC")
        editVC.hidesBottomBarWhenPushed = true
        viewC.navigationController?.pushViewController(editVC, animated: true)
    }
    
    /* 点击登录 */
    @IBAction func loginBtnClickFunc(_ sender: UIButton) {
        guard let viewC : UIViewController = self.firstViewController() else {
            return
        }
        let loginNav = UINavigationController.init(rootViewController: UIStoryboard(name: "LoginAndRegister", bundle: nil).instantiateViewController(withIdentifier: "loginVC"))
        viewC.showDetailViewController(loginNav, sender: nil)
    }
    
}

extension MineHeaderView {
    
    // 登录或不登录处理
    func updateAllWithLoginStatusFunc() -> Void {
        if UserDefaults.standard.value(forKey: "login") as? Bool ?? false {
            // 没有login这个字段或者字段值不为true即为不登录状态
            loginBtn.isHidden = true
            dataView.isHidden = false
            editView.isHidden = false
            // 用户名称
            nameLB.text = "大佬(big old)"
            // 头像
            
        }else {
            loginBtn.isHidden = false
            dataView.isHidden = true
            editView.isHidden = true
        }
    }
    
}

