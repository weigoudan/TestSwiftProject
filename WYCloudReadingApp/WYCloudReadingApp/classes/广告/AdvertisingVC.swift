//
//  AdvertisingVC.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/8.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class AdvertisingVC: UIViewController {
    
    /* 广告图片 */
    lazy var adImageView : UIImageView = {
        let imageView = UIImageView.init(frame: view.bounds)
        // 比例缩放,剪切
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    
    

}
