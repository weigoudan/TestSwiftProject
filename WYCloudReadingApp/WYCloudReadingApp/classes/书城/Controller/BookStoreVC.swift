//
//  BookStoreVC.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/7.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class BookStoreVC: UIViewController {
    
    static let bsLevelCellIdnetifier = "bsLevelCell"
    static let bsVerticalCellIdnetifier = "bsLevelCell"
    static let bsTitleHeaderIdentifier = "bsTitleHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 白色背景颜色
        view.backgroundColor = .white
        // 添加子视图控制器
        initChildrenViewController()
        // 添加子视图
        view.addSubview(topMenuView)
        view.addSubview(pageScrollView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 隐藏导航栏
        navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - 懒加载
    
    // 顶部菜单view
    lazy var topMenuView: BookStoreTopMenuView = {
        let view = BookStoreTopMenuView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 100), titleArray: nil)
        return view
    }()
    
    // 左右滚动视图
    lazy var pageScrollView: SGPageContentScrollView = {
        let view: SGPageContentScrollView = SGPageContentScrollView.init(frame: CGRect(x: 0, y: topMenuView.frame.maxY, width: kScreenWidth, height: kScreenHeight-topMenuView.frame.maxY-49), parentVC: self, childVCs: self.children)
        view.delegatePageContentScrollView = self
        return view
    }()

}

extension BookStoreVC: SGPageContentScrollViewDelegate {
    
    private func initChildrenViewController() -> Void {
        /* 精选 */
        let handpickVC: BSHandpickVC = BSHandpickVC()
//        handpickVC.view.frame = CGRect(x: 0, y: 0, width: bottomScrollView.frame.width, height: bottomScrollView.frame.height)
        addChild(handpickVC)
        /* 免费 */
        let freeVC: BSFreeVC = BSFreeVC()
        addChild(freeVC)
        /* 男生 */
        let schoolboyVC: BSSchoolboyVC = BSSchoolboyVC()
        addChild(schoolboyVC)
        /* 女生 */
        let schoolgirlVC: BSSchoolgirlVC = BSSchoolgirlVC()
        addChild(schoolgirlVC)
        /* 出版 */
        let publishVC: BSPublishVC = BSPublishVC()
        addChild(publishVC)
        /* 听书 */
        let listenStoryVC: BSListenStoryVC = BSListenStoryVC()
        addChild(listenStoryVC)
    }
    
    /// 联动 SGPageTitleView 的方法
    func pageContentScrollView(_ pageContentScrollView: SGPageContentScrollView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        
    }

}

