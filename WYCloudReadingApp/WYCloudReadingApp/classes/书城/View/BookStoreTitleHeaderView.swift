//
//  BookStoreTitleHeaderView.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/12/5.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class BookStoreTitleHeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lineView)
        addSubview(titleLB)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        lineView.mas_makeConstraints { (make) in
            make?.top.equalTo()(self)
            make?.left.equalTo()(self)?.with()?.offset()(15.0)
            make?.right.equalTo()(self)?.with()?.offset()(-15.0)
            make?.height.mas_equalTo()(1.0)
        }
        titleLB.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.lineView)
            make?.bottom.equalTo()(self)
        }
    }
    
    //MARK: - 懒加载
    // 分割线
    lazy var lineView: UIView = {
        
        let view: UIView = UIView.init()
        view.backgroundColor = kDefaultGrayColor
        return view
    }()
    
    // 标题
    lazy var titleLB: UILabel = {
        
        let lable: UILabel = UILabel.init()
        lable.font = UIFont.systemFont(ofSize: 24.0)
        return lable
    }()
        
}

extension BookStoreTitleHeaderView {
    
    //MARK: - 设置标题
    func setTitleForView(title: String) -> Void {
        self.titleLB.text = title
    }
    
}
