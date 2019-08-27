//
//  ViewModel.swift
//  SwiftUIBasic
//
//  Created by season on 2019/8/26.
//  Copyright © 2019 season. All rights reserved.
//

import Foundation
import Alamofire

struct ViewModel {
    static func getListModelInfo(callback: @escaping ([ListItem]?, AFError?) -> Void) {
        /// Alamofire已经内置解析Codable协议的模型了
        AF.request("http://sun.topray-media.cn/tz_inf/api/topics", method: .post).responseDecodable { (response: DataResponse<ListModel, AFError>) in
            let model = response.value
            let error = response.error
            let list = model?.list?.compactMap{ return $0 }.filter{ return $0.topicOrder != nil }.sorted{ $0.topicOrder! > $1.topicOrder! }
            callback(list, error)
        }
    }
}
