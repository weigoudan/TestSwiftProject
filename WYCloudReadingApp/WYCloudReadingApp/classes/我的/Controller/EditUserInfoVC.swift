//
//  EditUserInfoVC.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/9.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class EditUserInfoVC: UIViewController {
    
    /* scrollView.top约束 */
    @IBOutlet weak var scrollView_constraintTop: NSLayoutConstraint!
    /* scrollView的宽 */
    @IBOutlet weak var scrollConetnSizeWidth: NSLayoutConstraint!
    /* 头像 */
    @IBOutlet weak var headImgView: UIImageView!
    /* 昵称tf */
    @IBOutlet weak var nickNameTF: UITextField!
    /* 性别tf */
    @IBOutlet weak var genderTF: UITextField!
    /* 出生日期tf */
    @IBOutlet weak var birthdayTF: UITextField!
    /* 地区tf */
    @IBOutlet weak var areaTF: UITextField!
    /* 个人简介tv */
    @IBOutlet weak var descTV: UITextView!
    
    /* 自定义导航栏上的view */
    lazy private var navigationView: DefaultNavigationView = {
        let frame = kDeviceIsBangScreen ? CGRect(x: 0.0, y: 0.0, width: kScreenWidth, height: 88.0) : CGRect(x: 0.0, y: 0.0, width: kScreenWidth, height: 64.0)
        let view = DefaultNavigationView(frame: frame)
        view.titleString = "设置"
        // 点击左侧返回按钮
        view.leftTapBlock = { [weak self] in
            self!.navigationController!.popViewController(animated: true)
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 添加导航栏view
        view.addSubview(navigationView)
        // 设置约束
        scrollConetnSizeWidth.constant = kScreenWidth
        scrollView_constraintTop.constant = navigationView.frame.maxY
        
    }
    
    //MARK: - Event
    
    /* 选择头像 */
    @IBAction func chooseHeadImageTapClickFunc(_ sender: UITapGestureRecognizer) {
        showActionSheetFunc(type: .chooseGender)   // 弹出actionSheet
    }
    
    /* 选择性别 */
    @IBAction func chooseGenderTapClickFunc(_ sender: UITapGestureRecognizer) {
        showActionSheetFunc(type: .choosePicture)   // 弹出actionSheet
    }
    
    /* 选择出生日期 */
    @IBAction func chooseBirthdayTapClickFunc(_ sender: UITapGestureRecognizer) {
        
    }
    
    /* 选择地区 */
    @IBAction func chooseAreaTapClickFunc(_ sender: UITapGestureRecognizer) {
        
    }
    
    /* 保存 */
    @IBAction func saveBtnClickFunc(_ sender: UIButton) {
        
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

extension EditUserInfoVC: UITextFieldDelegate, UITextViewDelegate {
    
    /* 弹出actionSheet */
    private func showActionSheetFunc(type: ShowActionSheetType) -> Void {
        view.endEditing(true)
        // 选择性别
        let actionSheet = UIAlertController.init(title: nil, message: "请选择性别", preferredStyle: .actionSheet)
        let manAction = UIAlertAction.init(title: "男", style: .default) { (alert: UIAlertAction) in
            // 存储用户性别
            UserDefaults.standard.set(1, forKey: "gender")
            // 更新tf
            self.genderTF.text = "男"
        }
        let womanAction = UIAlertAction.init(title: "女", style: .default) { (alert: UIAlertAction) in
            UserDefaults.standard.set(2, forKey: "gender")
            self.genderTF.text = "女"
        }
        let cancelAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        // 添加action
        actionSheet.addAction(manAction)
        actionSheet.addAction(womanAction)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true, completion: nil)
    }
    
    //MARK: - textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}

