//
//  NetworkingManager.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/10/15.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import Alamofire
import SwiftyJSON

protocol NetworkingProtocol {
    
    
    //MARK: - -------------------------------------书城------------------------------------------
    //MARK: - 首页
    static func loadBookStoreIndexPageData(completeHandle: @escaping (_ indexData: [[String: Any]]) -> ())
    
}


let url_bookStoreIndexPage = "/store/show.json"


extension NetworkingProtocol {
    
    static func loadBookStoreIndexPageData(completeHandle: @escaping (_ indexData: [[String: Any]]) -> ()) {
        let url = kBASIC_URL + url_bookStoreIndexPage
        let params = ["type":"recommend", "uuid": deviceID]
        
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            // 网络错误的提示信息
            guard response.result.isSuccess else { return }
            if let value = response.result.value {
                let json = JSON(value)
                print(json)
                guard json["resCode"] == 0 else { return }
                completeHandle((json["data"] as! Dictionary)["list"]!)
            }
        }
    }
    
}

struct NetworkingManager: NetworkingProtocol {}
