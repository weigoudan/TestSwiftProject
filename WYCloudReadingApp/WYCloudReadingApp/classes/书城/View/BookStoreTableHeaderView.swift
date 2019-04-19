//
//  BookStoreTableHeaderView.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/29.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

let menuItemnWidth: CGFloat = 40.0

class BookStoreTableHeaderView: UICollectionReusableView {
    
    let menuItemSourceArray = [["icon": "image_swift", "title": "排行"], ["icon": "image_swift", "title": "精品"], ["icon": "image_swift", "title": "新书"], ["icon": "image_swift", "title": "福利"]]

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 加载子视图
        addSubview(headerScrollView)
        initMenuItem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 加载4个item
    private func initMenuItem() -> Void {
        let spaceInsert = (kScreenWidth-4*menuItemnWidth)/5
        for i in 0..<4 {
            let item: MenuItem = MenuItem.init(frame: CGRect(x: spaceInsert+CGFloat(i)*(spaceInsert+menuItemnWidth), y: headerScrollView.frame.maxY+10.0, width: menuItemnWidth, height: 65.0))
            // 设置数据
            item.setDataForView(with: menuItemSourceArray[i])
            addSubview(item)
        }
    }
    
    //MARK: - 懒加载
    // 轮播图
    lazy var headerScrollView: SDCycleScrollView = {
        
        let scrollView: SDCycleScrollView = SDCycleScrollView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 120), delegate: self as SDCycleScrollViewDelegate, placeholderImage: nil)
        return scrollView
    }()

}

extension BookStoreTableHeaderView: SDCycleScrollViewDelegate {
    
    //MARK: - 轮播图点击
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        
    }
    
}

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

class MenuItem: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 添加子视图
        addSubview(iconImgView)
        addSubview(titleLB)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        // 设置约束
        iconImgView.mas_makeConstraints { (make) in
            make?.top.equalTo()(self)
            make?.centerX.equalTo()(self)
            make?.width.mas_equalTo()(menuItemnWidth)
            make?.height.mas_equalTo()(menuItemnWidth)
        }
        titleLB.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.iconImgView.mas_bottom)
            make?.height.mas_equalTo()(15.0)
        }
    }
    
    //MARK: - Public Func
    func setDataForView(with dict: Dictionary<String, Any>) -> Void {
        // icon
        iconImgView.image = UIImage.init(named: dict["icon"] as! String)
        // 标题
        titleLB.text = dict["title"] as? String ?? ""
    }
    
    //MARK: - 懒加载
    
    // icon图标
    lazy var iconImgView: UIImageView = {
        
        let imgView: UIImageView = UIImageView.init()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    // 标题
    lazy var titleLB: UILabel = {
        
        let lable: UILabel = UILabel.init()
        lable.font = UIFont.systemFont(ofSize: 15)
        lable.textAlignment = .center
        lable.textColor = .darkGray
        return lable
    }()
}

