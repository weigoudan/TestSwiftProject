//
//  BookStoreVerticalCell.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/29.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit
import Kingfisher

class BookStoreVerticalCell: UICollectionViewCell {
    
    // 封面图片
    @IBOutlet weak var coverImgView: UIImageView!
    // 标题
    @IBOutlet weak var titleLB: UILabel!
    // 作者
    @IBOutlet weak var authorLB: UILabel!
    // 简介
    @IBOutlet weak var descLB: UILabel!
    
    // model
//    var dataModel: 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDataForCell(with dict: Dictionary<String, Any>) -> Void {
        // 封面
        coverImgView.kf.setImage(with: URL.init(string: dict[""] as! String))
        // 标题
        titleLB.text = dict["title"] as? String
        // 作者
        authorLB.text = "\(dict["author"]!)\\\(dict["category"]!)"
        // 简介
        descLB.text = dict["content"] as? String
    }

}
