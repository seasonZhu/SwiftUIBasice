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
        
    @State var isNetWorkSuccess = false
    
    /// 模拟器中看SwiftUI还是有很多bug的
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
                    ActivityIndicatorView()
                        .frame(width: 40, height: 40)
                        .previewLayout(.sizeThatFits)
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
            isNetWorkSuccess = news != nil
            list = news
            //print(news)
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

/// 桥接的效果并不是很好 找了一个轮子ActivityIndicatorView
struct IndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ view: UIActivityIndicatorView, context: Context) {
        view.startAnimating()
    }
}
