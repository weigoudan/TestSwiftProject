//
//  SetDefaultCell.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/9.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class SetDefaultCell: UITableViewCell {
    
    /* 标题 */
    @IBOutlet weak var titleLB: UILabel!
    /* 系统字体标签 */
    @IBOutlet weak var rightLB: UILabel!
    /* 右侧小箭头 */
    @IBOutlet weak var rightIconImgView: UIImageView!
    /* 右侧开关 */
    @IBOutlet weak var rightSwitchView: UISwitch!
    /* 分割线 */
    @IBOutlet weak var lineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
