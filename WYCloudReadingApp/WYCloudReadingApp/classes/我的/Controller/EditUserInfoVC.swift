//
//  EditUserInfoVC.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/9.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class EditUserInfoVC: UIViewController {
    
    /* 保存选取头像 */
    var editImage : UIImage?
    
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
        // 加载本地用户数据
        setDataForViewFunc()
    }
    
    //MARK: - Event
    
    /* 选择头像 */
    @IBAction func chooseHeadImageTapClickFunc(_ sender: UITapGestureRecognizer) {
        showActionSheetFunc(type: .choosePicture)   // 弹出actionSheet
    }
    
    /* 选择性别 */
    @IBAction func chooseGenderTapClickFunc(_ sender: UITapGestureRecognizer) {
        showActionSheetFunc(type: .chooseGender)
    }
    
    /* 选择出生日期 */
    @IBAction func chooseBirthdayTapClickFunc(_ sender: UITapGestureRecognizer) {
        
    }
    
    /* 选择地区 */
    @IBAction func chooseAreaTapClickFunc(_ sender: UITapGestureRecognizer) {
        
    }
    
    /* 保存 */
    @IBAction func saveBtnClickFunc(_ sender: UIButton) {
        // 保存头像
        if editImage != nil {
            if DBFileManager.saveImageForDirectory(with: editImage!, named: "userHeadImage.png", filePath: .caches) == false {
                SVProgressHUD.showError(withStatus: "保存图片失败")
            }
        }
        // 保存昵称
        if self.nickNameTF.text?.count ?? 0 > 0 {
            UserDefaults.standard.set(self.nickNameTF.text!, forKey: "userNickName")
        }
        // 保存性别
        if self.genderTF.text?.count ?? 0 > 0 {
            // 存储用户性别
            UserDefaults.standard.set(self.genderTF.text, forKey: "userGender")
        }
        // 保存生日
        if self.birthdayTF.text?.count ?? 0 > 0 {
            UserDefaults.standard.set(self.birthdayTF.text!, forKey: "userBirthday")
        }
        // 保存地区
        if self.areaTF.text?.count ?? 0 > 0 {
            UserDefaults.standard.set(self.areaTF.text!, forKey: "userArea")
        }
        // 保存个人简介
        if self.descTV.text?.count ?? 0 > 0 {
            UserDefaults.standard.set(self.descTV.text!, forKey: "userDesc")
        }
        SVProgressHUD.showSuccess(withStatus: "信息保存成功")
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

extension EditUserInfoVC: UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Private Func
    /* 加载本地数据 */
    private func setDataForViewFunc() -> Void {
        // 头像
        if let data = DBFileManager.getDataForDirectory(named: "/images/userHeadImage.png", filePath: .caches) {
            headImgView.image = UIImage.init(data: data as Data)
        }
        // 昵称
        if let nickName = UserDefaults.standard.value(forKey: "userNickName") {
            nickNameTF.text = (nickName as! String);
        }
        // 性别
        if let gender = UserDefaults.standard.value(forKey: "userGender") {
            genderTF.text = (gender as! String);
        }
        // 简介
        if let desc = UserDefaults.standard.object(forKey: "userDesc") {
            descTV.text = (desc as! String);
        }
    }
    /* 弹出actionSheet */
    private func showActionSheetFunc(type: ShowActionSheetType) -> Void {
        // 关闭键盘
        view.endEditing(true)
        // 设置弹出信息
        let message = type == .choosePicture ? "选择图片源" : "选择性别"
        let firstActionTitle = type == .choosePicture ? "从照片库中选择" : "男"
        let secondActionTitle = type == .choosePicture ? "拍照" : "女"
        // 选择性别
        let actionSheet = UIAlertController.init(title: nil, message: message, preferredStyle: .actionSheet)
        let firstAction = UIAlertAction.init(title: firstActionTitle, style: .default) { (alert: UIAlertAction) in
            if type == .choosePicture {
                // 图片库选取
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    // 有照片库权限
                    let imagePC : UIImagePickerController = UIImagePickerController()
                    imagePC.sourceType = .photoLibrary
                    imagePC.delegate = self
                    imagePC.allowsEditing = true
                    self.present(imagePC, animated: true, completion: nil)
                }else {
                    // 没有权限,提示到设置中去设置
                    self.showPushSetPageAlertControllerFunc(message: "App没有得到照片库开启权限,是否去设置中开启?")
                }
            }else {
                // 更新tf
                self.genderTF.text = firstActionTitle
            }
        }
        let secondAction = UIAlertAction.init(title: secondActionTitle, style: .default) { (alert: UIAlertAction) in
            if type == .choosePicture {
                // 拍照
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    // 有摄像头权限
                    let imagePC : UIImagePickerController = UIImagePickerController()
                    imagePC.sourceType = .camera
                    imagePC.delegate = self
                    imagePC.allowsEditing = true
                    self.present(imagePC, animated: true, completion: nil)
                }else {
                    self.showPushSetPageAlertControllerFunc(message: "App没有得到摄像头开启权限,是否去设置中开启?")
                }
            }else {
                self.genderTF.text = firstActionTitle
            }
        }
        let cancelAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        // 添加action
        actionSheet.addAction(firstAction)
        actionSheet.addAction(secondAction)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true, completion: nil)
    }
    
    private func showPushSetPageAlertControllerFunc(message: String) -> Void {
        // 没有相应权限,跳转设置界面
        let actionSheet = UIAlertController.init(title: nil, message: message, preferredStyle: .actionSheet)
        let confirmAction = UIAlertAction.init(title: "去设置", style: .destructive) { (alert: UIAlertAction) in
            // 跳转到设置中应用下的界面
            let url = URL(string: UIApplication.openSettingsURLString)
            if UIApplication.shared.canOpenURL(url!) {
                UIApplication.shared.openURL(url!)
            }
        }
        let cancelAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        // 添加action
        actionSheet.addAction(confirmAction)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true, completion: nil)
    }
    
    //MARK: - textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        // 获取截取后的image
        editImage = info[.editedImage] as? UIImage
        // 设置头像
        headImgView.image = editImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        SVProgressHUD.showInfo(withStatus: "您取消了图片选择")
    }
    
}

