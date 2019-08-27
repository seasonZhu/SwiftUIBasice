//
//  ListCell.swift
//  SwiftUIBasic
//
//  Created by season on 2019/8/26.
//  Copyright © 2019 season. All rights reserved.
//

import SwiftUI

struct ListCell: View {
    
    let item: ListItem
    
    var body: some View {
//        HStack {
//            Image(item.topicImageUrl ?? "")
//                .frame(width: 30, height: 30, alignment: .center)
//        }
        
        NavigationLink(destination: ToastOrderView()) {
            VStack(alignment: .leading, spacing: 10) {
                Text("title: \(item.topicTittle ?? "None")")
                    .lineLimit(2)
                Text("Detail: \(item.topicDesc ?? "None")")
                    .lineLimit(2)
            }
        }
    }
}

//struct ListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCell(item: item)
//    }
//}
