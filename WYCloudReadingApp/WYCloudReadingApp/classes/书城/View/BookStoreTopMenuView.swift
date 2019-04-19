//
//  BookStoreTopMenuView.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/29.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class BookStoreTopMenuView: UIView {
    
    // 菜单标题数据源
    var titleSourceArray: [String] = ["精选", "免费", "男生", "女生", "出版", "听书"]
    // 当前按钮选中下标
    var menuBtnSelectedIndex: Int = BookStoreTopMenuButtonTag
    
    
    /* 实例化成员方法 */
    public init(frame: CGRect, titleArray: Array<String>?) {
        super.init(frame: frame)
        backgroundColor = .white
        
        // 可设置标题数据源
        if titleArray != nil {
            titleSourceArray = titleArray!
        }
        // 初始化标题按钮
        initMenuButton()
        // 添加滚动线条
        addSubview(scrollLineView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 滚动线条
    lazy var scrollLineView: UIView = {
        // 默认与第一个选中的按钮垂直居中
        let lineView: UIView = UIView.init(frame: CGRect(x: (viewWithTag(BookStoreTopMenuButtonTag) as! UIButton).center.x-10, y: (viewWithTag(BookStoreTopMenuButtonTag) as! UIButton).frame.maxY, width: 20, height: 2))
        lineView.backgroundColor = .red
        lineView.layer.cornerRadius = 1
        return lineView
    }()

}

extension BookStoreTopMenuView {

    //MARK: - 初始化菜单按钮
    private func initMenuButton() -> Void {
        
        for (index, value) in titleSourceArray.enumerated() {
            // 配置按钮
            let btn: UIButton = UIButton(type: .custom)
            btn.frame = CGRect(x: CGFloat(index)*kScreenWidth/CGFloat(titleSourceArray.count), y: 10, width: kScreenWidth/CGFloat(titleSourceArray.count), height: 35)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.setTitle(value, for: .normal)
            btn.setTitleColor(.darkGray, for: .normal)
            // 点击事件
            btn.addTarget(self, action: #selector(menuBtnClicked(sender:)), for: .touchUpInside)
            // 设置tag
            btn.tag = BookStoreTopMenuButtonTag+index
            
            addSubview(btn)
        }
        
        // 默认选中第一个
        (viewWithTag(BookStoreTopMenuButtonTag) as! UIButton).titleLabel?.font = UIFont.systemFont(ofSize: 18)
        (viewWithTag(BookStoreTopMenuButtonTag) as! UIButton).setTitleColor(.black, for: .normal)
    }
    
    //MARK: - 滚动线条
    func scrollLineViewForClickMenuButton() -> Void {
        
    }
 
    //MARK: - 菜单按钮点击
    @objc private func menuBtnClicked(sender: UIButton) -> Void {
        if sender.tag-BookStoreTopMenuButtonTag != menuBtnSelectedIndex {
            // 重新新设置菜单按钮
            (viewWithTag(menuBtnSelectedIndex) as! UIButton).titleLabel?.font = UIFont.systemFont(ofSize: 14)
            (viewWithTag(menuBtnSelectedIndex) as! UIButton).setTitleColor(.darkGray, for: .normal)
            menuBtnSelectedIndex = sender.tag
            sender.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            sender.setTitleColor(.black, for: .normal)
            
            // 滚动底部线条
            scrollLineViewForClickMenuButton()
        }
    }
    
}
