//
//  NewsListView.swift
//  SwiftUIBasic
//
//  Created by season on 2020/10/28.
//  Copyright © 2020 season. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    
    @State var list: [News]?
    
    @State var isDisable = true
    
    @State var isNetWorkSuccess = false
    
    var body: some View {
        ZStack {
            if isNetWorkSuccess {
                List {
                    Section {
                        ForEach(list!) {
                            NewsListCell(news: $0)
                        }
                    }
                }
            }else {
                VStack {
                    Text("正在加载")
                    IndicatorView()
                }
            }
        }
        .navigationBarTitle("UniApp")
        .onAppear {
            print("视图即将展现")
            self.netWorkRequest()
        }.onDisappear {
            print("视图即将消失")
        }
    }
    
    /// 网络请求
    func netWorkRequest() {
        NewsRequest.getNews { (news, error) in
            self.isNetWorkSuccess = news != nil
            self.list = news
            print(news)
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

struct NewsListCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsListCell(news: News(authorAvatar: "http://112.74.43.107/Public/banner/1.png", authorEmail: nil, authorName: nil, columnId: nil, columnName: nil, commentsCount: nil, content: "内容", cover: nil, createdAt: "2020-10-28", fromId: nil, id: 1233, postId: nil, publishedAt: nil, storeAt: nil, summary: nil, title: "测试", type: nil, updatedAt: nil, viewsCount: 0))
    }
}

struct IndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ view: UIActivityIndicatorView, context: Context) {
        view.startAnimating()
    }
}
