//
//  MyInfoVC.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/9.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class MyInfoVC: UIViewController {
    
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
