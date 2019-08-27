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
    
    var body: some View {
        VStack(spacing: 10) {
            KFImage(URL(string: item.topicImageUrl!)!)
                .placeholder {
                    Image("turtlerock")
                }
                .resizable(capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10), resizingMode: .stretch)
                .frame(width: 300, height: 300, alignment: .center)
            .cornerRadius(10)
            .onTapGesture {
                print("图片的点击事件,想放大图片")
                self.isScale = !self.isScale
            }
            
            Text(item.upTime ?? "No Time").font(.body).foregroundColor(.gray)
            
            Text(item.topicDesc ?? "No Desc").font(.title).foregroundColor(.primary).lineLimit(10)
            
        }.navigationBarTitle(item.topicTittle ?? "Title")
    }
}

//struct ListDetaiView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListDetaiView()
//    }
//}
