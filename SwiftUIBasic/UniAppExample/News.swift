//
//  News.swift
//  SwiftUIBasic
//
//  Created by season on 2020/10/28.
//  Copyright © 2020 season. All rights reserved.
//

import Foundation

struct News : Codable, Identifiable {

    let authorAvatar : String?
    let authorEmail : String?
    let authorName : String?
    let columnId : String?
    let columnName : String?
    let commentsCount : Int?
    let content : String?
    let cover : String?
    let createdAt : String?
    let fromId : String?
    let id : Int?
    let postId : String?
    let publishedAt : String?
    let storeAt : String?
    let summary : String?
    let title : String?
    let type : String?
    let updatedAt : String?
    let viewsCount : Int?


    enum CodingKeys: String, CodingKey {
        case authorAvatar = "author_avatar"
        case authorEmail = "author_email"
        case authorName = "author_name"
        case columnId = "column_id"
        case columnName = "column_name"
        case commentsCount = "comments_count"
        case content = "content"
        case cover = "cover"
        case createdAt = "created_at"
        case fromId = "from_id"
        case id = "id"
        case postId = "post_id"
        case publishedAt = "published_at"
        case storeAt = "store_at"
        case summary = "summary"
        case title = "title"
        case type = "type"
        case updatedAt = "updated_at"
        case viewsCount = "views_count"
    }
}
