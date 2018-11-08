//
//  MineVC.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/7.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class MineVC: UIViewController {
    
    // cellIdentifier
    let defaultCellIdentifier = "mineItemDefaultCell"
    let rightViewCellIdentifier = "mineItemRightViewCell"
    /* 列表 */
    lazy var bottomTableView : UITableView = {
        // 初始化
        let frame = kDeviceIsBangScreen ? CGRect(x: 0.0, y: 44.0, width: kScreenWidth, height: kScreenHeight-44.0-83.0) : CGRect(x: 0.0, y: 0.0, width: kScreenWidth, height: kScreenHeight-49.0)
        let tableView = UITableView.init(frame: frame, style: .grouped)
        tableView.backgroundColor = view.backgroundColor
        // 设置属性
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        // 注册cell
        tableView.register(UINib.init(nibName: "MineItemDefaultCell", bundle: nil), forCellReuseIdentifier: defaultCellIdentifier)
        tableView.register(UINib.init(nibName: "MineItemRightViewCell", bundle: nil), forCellReuseIdentifier: rightViewCellIdentifier)
        
        return tableView;
    }()
    
    /* 区头 */
    lazy var headerView: MineHeaderView = {
        let hView = Bundle.main.loadNibNamed("MineHeaderView", owner: self, options: nil)?.first as! MineHeaderView
        hView.frame = CGRect(x: 0.0, y: 0.0, width: kScreenWidth, height: 170.0)
        return hView
    }()
    
    /* 数据源 */
    let sourceArray : [[[String : String]]] = Tools.getPlistFileSourceFunc(path: "MineItem", fileType: .PlistTypeForArray) as! [[[String : String]]]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "我的"
        // 添加子视图
        view.addSubview(bottomTableView)
        // 刷新列表
        bottomTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 隐藏导航栏
        navigationController?.isNavigationBarHidden = true
        // 登录状态设置一切
        headerView.updateAllWithLoginStatusFunc()
    }

}


extension MineVC : UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 170.0
        }
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10.0
        }
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //MARK: - dataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row < 2 {  // 余额  做任务领红包
                let cell = tableView.dequeueReusableCell(withIdentifier: rightViewCellIdentifier) as! MineItemRightViewCell
                // 控件赋值
                cell.iconImgView.image = UIImage.init(named: sourceArray[indexPath.section][indexPath.row]["icon"]!)
                cell.titleLB.text = sourceArray[indexPath.section][indexPath.row]["title"]!
                cell.modeView.isHidden = true
                cell.rightBtn.isHidden = false
                // 设置右侧按钮
                if indexPath.row == 0 {
                    cell.rightBtn.backgroundColor = .red
                    cell.rightBtn.setTitle("充值", for: .normal)
                    cell.rightBtn.setTitleColor(.white, for: .normal)
                }else {
                    cell.rightBtn.backgroundColor = .white
                    cell.rightBtn.setTitle("签到", for: .normal)
                    cell.rightBtn.setTitleColor(.red, for: .normal)
                }
                return cell
            }else { // 我的消息
                let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier) as! MineItemDefaultCell
                cell.iconImgView.image = UIImage.init(named: sourceArray[indexPath.section][indexPath.row]["icon"]!)
                cell.titleLB.text = sourceArray[indexPath.section][indexPath.row]["title"]
                return cell
            }
        }else {
            if indexPath.row == 2 {
                // 设置
                let cell = tableView.dequeueReusableCell(withIdentifier: rightViewCellIdentifier) as! MineItemRightViewCell
                cell.iconImgView.image = UIImage.init(named: sourceArray[indexPath.section][indexPath.row]["icon"]!)
                cell.titleLB.text = sourceArray[indexPath.section][indexPath.row]["title"]!
                cell.modeView.isHidden = false
                cell.rightBtn.isHidden = true
                return cell
            }else { // 其他
                let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier) as! MineItemDefaultCell
                cell.iconImgView.image = UIImage.init(named: sourceArray[indexPath.section][indexPath.row]["icon"]!)
                cell.titleLB.text = sourceArray[indexPath.section][indexPath.row]["title"]!
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        if section == 0 {
        let footerView = UIView.init()
        if section == 0 {
            footerView.backgroundColor = UIColor(hexCode: "#F2F2F2")
        }else {
            footerView.backgroundColor = .white
        }
        return footerView
//        }
//        return nil
    }
    
}

