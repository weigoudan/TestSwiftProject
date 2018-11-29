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
    class func saveImageForDirectory(with image: UIImage, named imageName: String, fileTypePath: AppDirectoryPath) -> Bool {
        guard let pathString = getFilePath(with: fileTypePath) else {
            return false
        }
        // 图片都保存在 ./caches/images/ 下
        let imagesPath = "\(pathString)/images/\(imageName)"
        if (!FileManager.default.fileExists(atPath: imagesPath)) {
            // 没有则创建
            try! FileManager().createDirectory(atPath: imagesPath, withIntermediateDirectories: true, attributes: nil)
        }
        // 根据路径保存image
        guard let imageData = image.jpegData(compressionQuality: 0.5) as NSData? else {
            return false
        }
        let result = imageData.write(toFile: imagesPath, atomically: true)
        print(result == true ? "图片保存成功" : "图片保存失败")
        return result
    }
    
    //MARK: - 保存plist文件到本地文件夹
    class func savePlistForDirectory(with sources: NSArray, named plistName: String, fileTypePath: AppDirectoryPath) -> Bool {
        guard let pathString = getFilePath(with: fileTypePath) else {
            return false
        }
        let dataPath = "\(pathString)\(plistName)"
//        if (!FileManager.default.fileExists(atPath: dataPath)) {
//            // 没有文件则创建
//            try! FileManager().createDirectory(atPath: dataPath, withIntermediateDirectories: true, attributes: nil)
//        }
        let result = sources.write(toFile: dataPath, atomically: true)
        print(result == true ? "数据保存成功" : "数据保存失败")
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

