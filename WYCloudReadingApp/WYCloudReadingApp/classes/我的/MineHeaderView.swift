//
//  MineHeaderView.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/7.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class MineHeaderView: UIView {
    
    /* 头像 */
    @IBOutlet weak var headImgView: UIImageView!
    
    /* 点击登陆label */
    @IBOutlet weak var loginLB: UILabel!
    
    /* 信息view */
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var levelLB: UILabel!
    @IBOutlet weak var levelLB_constraintWidth: NSLayoutConstraint!
    
    /* 编辑view */
    @IBOutlet weak var editView: UIView!
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    
    //MARK: - 点击事件
    /* 个人信息 */
    @IBAction func userDataTapClickFunc(_ sender: UITapGestureRecognizer) {
        
    }
    
    /* 编辑信息 */
    @IBAction func editTapClickFunc(_ sender: UITapGestureRecognizer) {
        
    }
    
}
