//
//  DataModel.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/7.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import Foundation


/* 我的 -> item数据结构体 */
struct MineItemData {
    var icon : String = ""
    var titel : String = ""
}

/* 书城 -> 轮播图model */
struct BookStoreBanner {
    var aboveAd: Int = 0
    var cover: String = ""
    var id: String = ""
    var mode: String = ""
    var msgId: Int = 0
    var name: String = ""
    var p_action: Int = 0
    var p_id: String = ""
    var title: String = ""
    var url: String = ""
}

/* 书城 -> 列表model */
struct BookModel {
    var author: String = ""
    var bookType: Int = 0
    var cartFlag: Int = 0
    var category: String = ""
    var clickCount: Int = 0
    var content: String = ""
    var cover: String = ""
    var d_begin: Int = 0
    var d_end: Int = 0
    var discountDesc: String = ""
    var iap_id: String = ""
    var iap_price: Double = 0
    var id: String = ""
    var integrity: Int = 0
    var nprice: Double = 0
    var nwprice: Double = 0
    var p_action: Int = 0
    var payment: Int = 0
    var price: Double = 0
    var recomContent: String = ""
    var reduce_begin: Int = 0
    var reduce_end: Int = 0
    var share_begin: Int = 0
    var share_end: Int = 0
    var style: Int = 0
    var title: String = ""
    var vip: Int = 0
    var wprice: Double = 0
}

