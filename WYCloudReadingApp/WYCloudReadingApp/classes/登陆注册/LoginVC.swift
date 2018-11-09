//
//  LoginVC.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/8.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    /* 手机号tf */
    @IBOutlet weak var phoneTF: UITextField!
    /* 密码tf */
    @IBOutlet weak var passwordTF: UITextField!
    /* 登录按钮 */
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
    }
    
    //MARK: - Event
    
    /* 左上角关闭 */
    @IBAction func leftCloseBtnClickFunc(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /* 登录按钮 */
    @IBAction func loginBtnClickFunc(_ sender: UIButton) {
        // 判断手机号码
        guard phoneTF.text!.checIskMobileNumber() else {
            SVProgressHUD.showInfo(withStatus: "手机号码输入有误哦,大佬~")
            return
        }
        // 判断密码不为空
        guard passwordTF.text!.count > 0 else {
            SVProgressHUD.showInfo(withStatus: "密码输入有误哦,大佬~")
            return
        }
        
        SVProgressHUD.showSuccess(withStatus: "恭喜大佬登录成功~")
        // 保存登录标识
        UserDefaults.standard.set(true, forKey: "login")
        // 返回上一级界面
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    /* 忘记密码、注册? */
    @IBAction func forgetOrRegisterBtnClickFunc(_ sender: UIButton) {
        navigationController?.pushViewController(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "placeholderVC"), animated: true)
    }
    
    /* 微信登录 */
    @IBAction func wxLoginBtnClickFunc(_ sender: UIButton) {
        SVProgressHUD.showInfo(withStatus: "iOS技术团队太懒,没接入微信登录~")
        
    }
    
    /* 微博登录 */
    @IBAction func wbLoginBtnClickFunc(_ sender: UIButton) {
        SVProgressHUD.showInfo(withStatus: "iOS技术团队太懒,没接入微博登录~")
    }
    
    /* 邮箱登录 */
    @IBAction func yxLoginBtnClickFunc(_ sender: UIButton) {
        SVProgressHUD.showInfo(withStatus: "iOS技术团队太懒,没接入邮箱登录~")
    }
    
    /* 监听tf输入 */
    @IBAction func tfEditDidChangeFunc(_ sender: UITextField) {
        /* 更改登录按钮的状态 */
        if phoneTF.text!.checIskMobileNumber() && passwordTF.text!.count > 0 {
            loginBtn.alpha = 1.0
        }else {
            loginBtn.alpha = 0.5
        }
    }
    
    //MARK: - textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 回收键盘
        textField.resignFirstResponder()
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
