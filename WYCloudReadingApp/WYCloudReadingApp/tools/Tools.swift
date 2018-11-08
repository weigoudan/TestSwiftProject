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

extension UIColor {
    
    /* 获取Hex颜色值 */
    convenience init(hexCode: String) {
        var cString:String = hexCode.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            self.init()
        } else {
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: 1)
        }
    }
    
}

extension UIView {
    
    /* 返回该view所在VC */
    func firstViewController() -> UIViewController? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
    
}

extension CALayer {
    
    /* 添加layer边框颜色 */
    var borderColorWithUIColor : UIColor? {
        set {
            self.borderColor = newValue!.cgColor
        }
        get {
//            return self.borderColorWithUIColor
            return nil
        }
    }
    
}

extension String {
    
    /**
     判断字符串是否为纯数字
     
     */
    func checkIsIntNumber() -> Bool {
        let scan: Scanner = Scanner(string: self)
        var val:Int = 0
        return scan.scanInt(&val) && scan.isAtEnd
        
//        let pattern = "^[0-9]+$"
//        if NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self) {
//            return true
//        }
//        return false
    }
    
    
    /**
     判断字符串是否为字母
     
     */
    func checkIsLetter() -> Bool {
        let pattern = "^^[A-Za-z0-9]+$"
        if NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self) {
            return true
        }
        return false
    }
    
    
    /**
     判断手机号码(只判断11为数字,1开头)
     
     */
    func checIskMobileNumber() -> Bool {
        guard self.count == 11 else {
            return false
        }
        let mobileFormat = "^1\\d{10}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@", mobileFormat)
        if regextestmobile.evaluate(with: self) {
            return true
        }
        return false
    }
    
    
    /**
     判断是否是金额的字符串
     
     */
    func checkIsMoneyNumber() -> Bool {
        let pattern = "^\\d+(\\.\\d{1,2})?$"
        if NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self) {
            return true
        }
        return false
    }

    
}

