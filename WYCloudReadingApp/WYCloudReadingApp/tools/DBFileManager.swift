//
//  DBFileManager.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/19.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class DBFileManager: NSObject {
    
    //MARK: - 把image保存在本地文件夹
    class func saveImageForDirectory(with image: UIImage, named imageName: String, filePath: AppDirectoryPath) -> Bool {
        guard let pathString = getFilePath(with: filePath) else {
            return false
        }
        // 根据路径保存image
        guard let imageData = image.pngData() as NSData? else {
            return false
        }
        let result = imageData.write(toFile: "\(pathString)/images/\(imageName)", atomically: true)
        return result
    }
    
    //MARK: - 根据路径获取data
    class func getDataForDirectory(named imageName: String, filePath: AppDirectoryPath) -> NSData? {
        guard let pathString = getFilePath(with: filePath) else {
            return nil
        }
        let data = NSData.init(contentsOfFile: pathString+imageName)
        return data
    }
    
}

//MARK: - 方法实现
extension DBFileManager {
    
    // 获取文件夹路径
    public class func getFilePath(with style: AppDirectoryPath) -> String? {
        switch style {
        case .documents:
            return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? nil
        case .tmp:
            return NSTemporaryDirectory()
        case .library:
            return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first ?? nil
        case .caches:
            return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first ?? nil
        case .preferences:
            return NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true).first ?? nil
        }
    }
    
}

