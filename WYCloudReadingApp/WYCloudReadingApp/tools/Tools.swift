//
//  Tools.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/7.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

/* plist文件类型 */
enum PlistFileType {
    case PlistTypeForArray
    case PlistTypeForDictionary
}

class Tools: NSObject {
    
    /* 根据传入的比例和宽度,以屏幕为基准获取高度 */
    class func getScaleHeightFunc(scaleWidth scaleWidth: CGFloat, scaleHeight scaleheight: CGFloat, width width: CGFloat) -> Void {
//        return
    }
    
    
    /* 通过路径获取plist文件 */
    class func getPlistFileSourceFunc(path string: String, fileType type: PlistFileType) -> Any? {
        guard let pathString = Bundle.main.path(forResource: string, ofType: "plist") else {
            return nil
        }
        // 根据类型获取数据
        switch type {
        case .PlistTypeForArray:
            return NSArray(contentsOfFile: pathString)
        default:
            return NSDictionary(contentsOfFile: pathString)
        }
    }
    
}
