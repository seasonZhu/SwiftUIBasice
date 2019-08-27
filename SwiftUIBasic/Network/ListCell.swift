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
    
    var body: some View {
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
