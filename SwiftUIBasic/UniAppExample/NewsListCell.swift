//
//  NewsListCell.swift
//  SwiftUIBasic
//
//  Created by season on 2020/10/28.
//  Copyright © 2020 season. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct NewsListCell: View {
    let news: News
    
    var body: some View {
        NavigationLink(destination: NewsDetailView(news: news)) {
            HStack {
                KFImage(URL(string: news.authorAvatar ?? "http://112.74.43.107/Public/banner/1.png"))
                    .resizable()
                    .frame(width: 66, height: 66, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                    HStack {
                        Text(news.title ?? "无标题")
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text("发布时间: " + (news.createdAt ?? "无创作时间"))
                            .font(.system(size: 13))
                            .foregroundColor(Color.gray)
                    }
                }).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            }
        }
    }
}

struct NewsListCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsListCell(news: News(authorAvatar: "http://112.74.43.107/Public/banner/1.png", authorEmail: nil, authorName: nil, columnId: nil, columnName: nil, commentsCount: nil, content: "内容", cover: nil, createdAt: "2020-10-28", fromId: nil, id: 1233, postId: nil, publishedAt: nil, storeAt: nil, summary: nil, title: "测试", type: nil, updatedAt: nil, viewsCount: 0))
    }
}
