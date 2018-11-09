//
//  MineItemRightViewCell.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/7.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class MineItemRightViewCell: UITableViewCell {
    
    /* icon */
    @IBOutlet weak var iconImgView: UIImageView!
    /* 标题 */
    @IBOutlet weak var titleLB: UILabel!
    /* 右侧按钮 */
    @IBOutlet weak var rightBtn: UIButton!
    
    /* 夜间模式view */
    @IBOutlet weak var modeView: UIView!
    @IBOutlet weak var modeIconImgView: UIImageView!
    @IBOutlet weak var modeTitleLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 给右侧按钮添加layer
        rightBtn.layer.borderColor = UIColor.red.cgColor
        // 给模式view添加手势
        let tap = UITapGestureRecognizer.init(target: self, action: Selector(("modeViewTapClickFunc:")))
        modeView.addGestureRecognizer(tap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: - 日间或夜间模式view点击
    func modeViewTapClickFunc(_ tap: UITapGestureRecognizer) -> Void {
        
    }
    
}
