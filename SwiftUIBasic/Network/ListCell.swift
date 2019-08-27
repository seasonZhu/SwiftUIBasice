//
//  ListCell.swift
//  SwiftUIBasic
//
//  Created by season on 2019/8/26.
//  Copyright © 2019 season. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ListCell: View {
    
    let item: ListItem
    
    /// Function declares an opaque return type, but the return statements in its body do not have matching underlying types
    /// 尴尬的是在boyd这个属性中,无法使用guard let 这样的函数去守护item中的可选类型
    var body: some View {
        /*
        guard let urlString = item.topicImageUrl, let url = URL(string: urlString) else {
            return HStack {
                Text("Error")
            }
        }
        */
        //let urlString = item.topicImageUrl
        //let url = URL(string: urlString!)
        HStack {
            KFImage(URL(string: item.topicImageUrl!)!)
                .placeholder {
                    Image("turtlerock")
                }
                .resizable()
                .frame(width: 44, height: 44, alignment: .center)
                .cornerRadius(8)
            
            NavigationLink(destination: ListDetaiView(item: item)) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(item.topicTittle ?? "None")")
                        .lineLimit(2)
//                    Text("Detail: \(item.topicDesc ?? "None")")
//                        .lineLimit(2)
                }
            }
        }
    }
}

//struct ListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCell(item: item)
//    }
//}
