//
//  GridView.swift
//  SwiftUIBasic
//
//  Created by season on 2019/9/6.
//  Copyright © 2019 season. All rights reserved.
//

import SwiftUI
import QGrid

struct GridView: View {
    
    let imageNames = ["c#.png",
     "html.png",
     "java.png",
     "js.png",
     "php.png",
     "react.png",
     "ruby.png",
     "swift.png",
     "xcode.png"
    ]
    
    let colors: [Color] = [.clear,
                           .black,
                           .white,
                           .gray,
                           .red,
                           .green,
                           .blue,
                           .orange,
                           .yellow,
                           .pink,
                           .purple,
                           .primary,
                           .secondary]
    
    var body: some View {
        NavigationView {
            QGrid(imageNames, columns: 3) { imageName in
                NavigationLink(destination: PictureView(imageName: imageName)) {
                    VStack {
                        Image(uiImage: UIImage(named: imageName)!)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        Button(action: {
                            self.pushTo(imageName: imageName)
                        }) {
                            Text(imageName).foregroundColor(self.colors.randomElement() ?? .red)
                        }
                    }
                }
            }
        }
    }
    
    func pushTo(imageName: String) {
        print("点击了\(imageName)")
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}

struct PictureView: View {
    
    let imageName: String
    
    var body: some View {
        VStack {
           Image(uiImage: UIImage(named: self.imageName)!)
            .resizable(capInsets: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0), resizingMode: .stretch)
            
        }.navigationBarTitle("编程语言")
    }
}

extension String: Identifiable {
    public var id: Int {
        hashValue
    }
}
