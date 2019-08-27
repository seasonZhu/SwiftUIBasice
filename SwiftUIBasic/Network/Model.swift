//
//  Model.swift
//  SwiftUIBasic
//
//  Created by season on 2019/8/26.
//  Copyright © 2019 season. All rights reserved.
//

import Foundation

struct ListItem: Codable, Identifiable {
    let topicImageUrl: String?
    let topicOrder: Int?
    let id: Int?
    let upTime: String?
    let topicStatus: Int?
    let topicTittle: String?
    let topicDesc: String?
}

struct ListModel : Codable, Identifiable {
    var id: Int {
        return code ?? 0
    }
    
    let list: [ListItem]?
    let code: Int?
}
