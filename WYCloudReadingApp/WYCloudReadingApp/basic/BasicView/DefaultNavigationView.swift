//
//  DefaultNavigationView.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/9.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class DefaultNavigationView: UIView {
    
    /* 标题 */
    var titleString: String = "" {
        didSet {
            // 设置标题
            titleLB.text = titleString
        }
    }
    /* 左侧按钮图标 */
    var leftImage: UIImage = UIImage.init(named: "icon_navBack")! {
        didSet {
            leftBtn.setImage(leftImage, for: .normal)
        }
    }
    /* 左侧按钮点击block */
    var leftTapBlock: (()->())?
    
    /* 左侧按钮 */
    lazy private var leftBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        // 配置按钮
        btn.setImage(leftImage, for: .normal)
        btn.addTarget(self, action: #selector(leftBtnClickFunc(sender:)), for: .touchUpInside)
        return btn
    }()
    /* 标题标签 */
    lazy private var titleLB: UILabel = {
        let label = UILabel.init()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.textAlignment = .center
        return label
    }()
    /* 底部分割线 */
    lazy private var lineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor(hexCode: "#b1b1b1")
        return view
    }()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        // 添加子控件
        addSubview(leftBtn)
        addSubview(titleLB)
        addSubview(lineView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DefaultNavigationView {
    
    /* 设置约束 */
    override func layoutSubviews() {
        // 左侧按钮
        leftBtn.mas_makeConstraints { (make: MASConstraintMaker?) in
            make?.left.equalTo()(self)?.with()?.offset()(10.0)
            make?.bottom.equalTo()(self)?.with()?.offset()(-7.0)
            make?.size.mas_equalTo()(CGSize(width: 30.0, height: 30.0))
        }
        // 中间标题
        titleLB.mas_makeConstraints { (make: MASConstraintMaker?) in
            make?.centerX.equalTo()(self)
            make?.centerY.equalTo()(leftBtn)
            make?.height.equalTo()(leftBtn)
        }
        // 分割线
        lineView.mas_makeConstraints { (make: MASConstraintMaker?) in
            make?.left.equalTo()(self)
            make?.right.equalTo()(self)
            make?.bottom.equalTo()(self)
            make?.height.mas_equalTo()(0.5)
        }
    }
    
    /* 左侧按钮点击事件 */
    @objc func leftBtnClickFunc(sender: UIButton) -> Void {
        // 回调实例对象
        leftTapBlock?()
    }
    
}

