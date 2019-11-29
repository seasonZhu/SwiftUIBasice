//
//  ListCell.swift
//  SwiftUIBasic
//
//  Created by season on 2019/8/26.
//  Copyright © 2019 season. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI
import SeasonSwiftExtension
import Alamofire

struct ListCell: View {
    
    let item: ListItem
    
    @State var image: UIImage?
    
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
            
        /// Kingfisher 目前真的是有问题, 另外图片的url已经失效了,临时写死了
//            KFImage(URL(string: "http://112.74.43.107/Public/banner/1.png")!)
//                .placeholder {
//                    Image("turtlerock")
//                }
//                .resizable()
//                .frame(width: 44, height: 44, alignment: .center)
//                .cornerRadius(8)
            
            Image(uiImage: image ?? UIImage(named: "turtlerock")!)
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
        }.onAppear {
            self.networkRequest()
        }
    }
    
    func networkRequest() {
        ViewModel.getItemUIImage(imageUrl: "http://112.74.43.107/Public/banner/1.png") { (image, _) in
            self.image = image
        }
    }
    
}

//struct ListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCell(item: item)
//    }
//}
