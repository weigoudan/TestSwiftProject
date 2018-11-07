//
//  RootTabbarController.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/10/15.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class RootTabbarController: UITabBarController {
    
    // 自定义tabbar
    var myTabbar : DefaultTabbarView  = DefaultTabbarView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // bar背景颜色
        tabBar.barTintColor = .white
        /* 初始化子视图控制器 */
        initChildViewControllerFunc(stringArray: [["className":"BookStoreVC", "itemTitle":"书城"], ["className":"ClassifyVC", "itemTitle":"分类"], ["className":"MineVC", "itemTitle":"我的"]])
        
    }

}

extension RootTabbarController {
    
    /* 初始化子视图控制器 */
    func initChildViewControllerFunc(stringArray array: [[String: String]]) -> Void {
        var viewCArray : [UINavigationController] = []
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        for value in array {
            guard let className = NSClassFromString(nameSpace!+"."+value["className"]!) as? UIViewController.Type else {
                continue;
            }
            let viewC = className.init()
            let navigation = DefaultNavController.init(rootViewController: viewC)
            navigation.tabBarItem = UITabBarItem.init(title: value["itemTitle"], image: nil, selectedImage: nil)
            viewCArray.append(navigation)
        }
        // 设置控制器数组
        viewControllers = viewCArray
    }
    
}

