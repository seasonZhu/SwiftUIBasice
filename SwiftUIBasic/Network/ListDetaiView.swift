//
//  ListDetaiView.swift
//  SwiftUIBasic
//
//  Created by season on 2019/8/27.
//  Copyright © 2019 season. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ListDetaiView: View {
    
    let item: ListItem
    
    @State var isScale = false
    
    /// Closure containing control flow statement cannot be used with function builder 'ViewBuilder'
    var body: some View {
        VStack(spacing: 10) {
//            KFImage(URL(string: item.topicImageUrl!)!)
//                .placeholder {
//                    Image("turtlerock")
//                }
//                .resizable(capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10), resizingMode: .stretch)
//                .frame(width: 300, height: 300, alignment: .center)
//            .cornerRadius(10)
//            .onTapGesture {
//                print("图片的点击事件,想放大图片")
//                self.isScale = !self.isScale
//            }
//
//            RemoteImageView(string: "")!.placeholder { () -> Image in
//                return Image("turtlerock")
//            }
            
            RemoteImageView(string: "http://112.74.43.107/Public/banner/1.png", placeholder: Image("turtlerock"))
                .frame(width: 300, height: 300, alignment: .center)
                .cornerRadius(10).onTapGesture {
                print("图片的点击事件,想放大图片")
                self.isScale = !self.isScale
            }
            
            Text(item.upTime ?? "No Time").font(.body).foregroundColor(.gray)
            
            Text(item.topicDesc ?? "No Desc").font(.title).foregroundColor(.primary).lineLimit(10)
            
        }.navigationBarTitle(item.topicTittle ?? "Title")
    }
    
    /// 如果在函数中做涉及返回的View类型的判断 而且判断之后返回的View的具体类型不相同 会直接报错
    /// Function declares an opaque return type, but the return statements in its body do not have matching underlying types
    private func getBody() -> some View {
        if let urlString = item.topicImageUrl, let url = URL(string: urlString) {
            print("网址有效")
            return Text("\(url.absoluteURL)")
        }else {
            //print("网址无效)
            return Text("Nothing")
//            return Button(action: {
//
//            }) {
//                Text("Press")
//            }
        }
    }
}

//struct ListDetaiView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListDetaiView()
//    }
//}
