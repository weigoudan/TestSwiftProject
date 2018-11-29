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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 白色背景颜色
        view.backgroundColor = .white
        // 添加子视图
        view.addSubview(topMenuView)
        view.addSubview(bottomTableView)
        
        // 请求列表数据
        
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
        return view;
    }()
    
    // 列表
    lazy var bottomTableView: UICollectionView = {
        // layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        
        let collectionView = UICollectionView.init(frame: CGRect(x: 0, y: topMenuView.frame.maxY, width: kScreenWidth, height: kScreenHeight-topMenuView.frame.maxY-49), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        //  注册cell
        collectionView.register(UINib.init(nibName: "BookStoreLevelCell", bundle: nil), forCellWithReuseIdentifier: BookStoreVC.bsLevelCellIdnetifier)
        collectionView.register(UINib.init(nibName: "BookStoreVerticalCell", bundle: nil), forCellWithReuseIdentifier: BookStoreVC.bsVerticalCellIdnetifier)
        return collectionView
    }()
    

}

extension BookStoreVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    
    
    
    
}

