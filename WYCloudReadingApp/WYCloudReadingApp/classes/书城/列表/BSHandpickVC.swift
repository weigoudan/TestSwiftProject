//
//  BSHandpickVC.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/29.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class BSHandpickVC: UIViewController {
    
    static let bsHeaderIdentifier = "bsHeader"
    
    var sorceArray: [[String: Any]] = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        // 添加列表
        view.addSubview(bottomCollectionView)
        
        // 请求列表数据
        NetworkingManager.loadBookStoreIndexPageData {_ in
            
        }
    }
    
    // 列表
    lazy var bottomCollectionView: UICollectionView = {
        // layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-100-49), collectionViewLayout: layout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
        //  注册cell
        collectionView.register(UINib.init(nibName: "BookStoreLevelCell", bundle: nil), forCellWithReuseIdentifier: BookStoreVC.bsLevelCellIdnetifier)
        collectionView.register(UINib.init(nibName: "BookStoreVerticalCell", bundle: nil), forCellWithReuseIdentifier: BookStoreVC.bsVerticalCellIdnetifier)
        // 注册区头
        collectionView.register(BookStoreTableHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BSHandpickVC.bsHeaderIdentifier)
        collectionView.register(BookStoreTitleHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BookStoreVC.bsTitleHeaderIdentifier)
        
        return collectionView
    }()
    
    
}

extension BookStoreVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            // 顶部区头
            let headerView: BookStoreTableHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BSHandpickVC.bsHeaderIdentifier, for: indexPath) as! BookStoreTableHeaderView
            return headerView
        }else {
            // 标题区头
            let headerView: BookStoreTitleHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BookStoreVC.bsTitleHeaderIdentifier, for: indexPath) as! BookStoreTitleHeaderView
            headerView.setTitleForView(title: "666")
            return headerView
        }
    }
    
    //MARK: - dataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BookStoreVerticalCell = collectionView.dequeueReusableCell(withReuseIdentifier: BookStoreVC.bsVerticalCellIdnetifier, for: indexPath) as! BookStoreVerticalCell
        cell.setDataForCell(with: [:])
        return cell
    }
    
    //MARK: - flowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kScreenWidth-30, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {   // 带轮播图区头
            return CGSize(width: kScreenWidth, height: 80.0+120*kScaleWith375)
        }
        return CGSize(width: kScreenWidth, height: 50.0)    // 标题区头
    }
    
}
