//
//  SetVC.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/9.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class SetVC: UIViewController {
    
    private let defaultCellIdentifier = "setDefaultCell"
    private let sourceArray = [["通知提醒"], ["护眼模式", "字体"], ["清除浏览缓存", "清除听书缓存"], ["评价云阅读", "关于"]]
    
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
    /* 列表 */
    lazy private var bottomTableView : UITableView = {
        // 初始化
        let tableView = UITableView.init(frame: CGRect(x: 0.0, y: navigationView.frame.maxY, width: kScreenWidth, height: kScreenHeight-navigationView.frame.maxY), style: .grouped)
        tableView.backgroundColor = view.backgroundColor
        // 设置属性
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        // 注册cell
        tableView.register(UINib.init(nibName: "SetDefaultCell", bundle: nil), forCellReuseIdentifier: defaultCellIdentifier)
        
        return tableView;
    }()
    /* 退出登录view */
    lazy private var logouFooterView: UIView = {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: kScreenWidth, height: 85.0))
        // 添加退出按钮
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect(x: 60.0, y: 40.0, width: view.frame.size.width-120.0, height: 45.0)
        btn.backgroundColor = UIColor(hexCode: "#FF7F69")
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        btn.setTitle("退出登录", for: .normal)
        // 设置layer
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(logouBtnClickFunc(sender:)), for: .touchUpInside)
        
        view.addSubview(btn)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(hexCode: "#F2F2F2")
        // 添加子视图
        view.addSubview(navigationView)
        view.addSubview(bottomTableView)
        
        // 刷新列表
        bottomTableView.reloadData()
    }
    
    //MARK: - 退出登录
    @objc func logouBtnClickFunc(sender: UIButton) -> Void {
        // 弹出actionSheet
        let actionSheet = UIAlertController.init(title: nil, message: "退出登录后,你将无法阅读此账号下的内容", preferredStyle: .actionSheet)
        let logouAction = UIAlertAction.init(title: "退出登录", style: .destructive) { (alert: UIAlertAction) in
            // 清除用户数据
            UserDefaults.standard.set(false, forKey: "login")
            // 刷新列表
            self.bottomTableView.reloadData()
        }
        let cancelAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        // 添加action
        actionSheet.addAction(logouAction)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true, completion: nil)
    }

}

extension SetVC: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == sourceArray.count-1 {
            if UserDefaults.standard.value(forKey: "login") as? Bool ?? false {
                return 85.0
            }
        }
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section > 1 {
            // 跳转占位图
            navigationController?.pushViewController(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "placeholderVC"), animated: true)
        }
    }
    
    //MARK: - dataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier) as! SetDefaultCell
        if indexPath.section == 0 {
            // 显示右侧开关
            cell.rightIconImgView.isHidden = true
            cell.rightLB.isHidden = true
            cell.rightSwitchView.isHidden = false
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {// 显示右侧开关
                cell.rightIconImgView.isHidden = true
                cell.rightLB.isHidden = true
                cell.rightSwitchView.isHidden = false
            }else {// 隐藏右侧开关
                cell.rightIconImgView.isHidden = false
                cell.rightLB.isHidden = false
                cell.rightSwitchView.isHidden = true
            }
        }else if indexPath.section == 2 {// 隐藏全部
            cell.rightIconImgView.isHidden = true
            cell.rightLB.isHidden = true
            cell.rightSwitchView.isHidden = true
        }else {// 只显示小箭头
            cell.rightIconImgView.isHidden = false
            cell.rightLB.isHidden = true
            cell.rightSwitchView.isHidden = true
        }
        // 分割线的显示与隐藏
        if indexPath.section > 0 && indexPath.row == 0 {
            cell.lineView.isHidden = false
        }else {
            cell.lineView.isHidden = true
        }
        // 标题赋值
        cell.titleLB.text = sourceArray[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == sourceArray.count-1 {
            if UserDefaults.standard.value(forKey: "login") as? Bool ?? false {
                return logouFooterView
            }
        }
        return UIView()
    }
    
}

