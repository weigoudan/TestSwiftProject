//
//  ExecuteHeader.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/7.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import Foundation
import UIKit


/**
 
 一些宏定义
 */


// 屏幕宽
let kScreenWidth = UIScreen.main.bounds.width

// 屏幕高
let kScreenHeight = UIScreen.main.bounds.height

// 判断是否是刘海屏
let kDeviceIsBangScreen = (ProcessInfo().isOperatingSystemAtLeast(OperatingSystemVersion(majorVersion: 11, minorVersion: 0, patchVersion: 0)) && UIApplication.shared.statusBarFrame.size.height > 20.0) ? true : false


