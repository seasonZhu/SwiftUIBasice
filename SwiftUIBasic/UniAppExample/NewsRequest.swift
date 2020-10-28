//
//  NewsRequest.swift
//  SwiftUIBasic
//
//  Created by season on 2020/10/28.
//  Copyright © 2020 season. All rights reserved.
//

import UIKit
import Alamofire

struct NewsRequest {
    static func getNews(callback: @escaping ([News]?, AFError?) -> Void) {
        /// Alamofire已经内置解析Codable协议的模型了
        AF.request("https://unidemo.dcloud.net.cn/api/news", method: .get).responseDecodable { (response: DataResponse<[News], AFError>) in
            let model = response.value
            let error = response.error
            callback(model, error)
        }
    }
}
