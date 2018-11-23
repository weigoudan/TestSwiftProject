//
//  Enum.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/10/29.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import Foundation

/**
 枚举文件
 */


/* 网路状态 */
enum AppNetworkingStatus {
    case noNetworking
    case wifiNetworking
    case wapNetworking
}

/* 本地沙盒文件路径 */
enum AppDirectoryPath {
    case documents
    case tmp
    case library
    // library文件夹下
    case caches
    case preferences
}

/* 弹出actionSheet的类型 */
enum ShowActionSheetType {
    case chooseGender
    case choosePicture
    
}


