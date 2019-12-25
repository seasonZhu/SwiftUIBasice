//
//  ExampleView.swift
//  SwiftUIBasic
//
//  Created by season on 2019/12/11.
//  Copyright © 2019 season. All rights reserved.
//

import SwiftUI

struct ExampleView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                // 文字
                Text("Hello World")
                .font(.largeTitle)
                .foregroundColor(Color.green)
                .lineSpacing(50)
                .lineLimit(nil)
                .padding()
                // 图片
                Image(systemName: "cloud.heavyrain.fill")
                .foregroundColor(.red)
                .font(.largeTitle)
                // 矩形
                Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                // 圆形
                Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                // 背景
                Text("haha")
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.white, .red, .black]),
                            startPoint: .leading,
                            endPoint: .trailing)
                    )
                //Z轴布局
                ZStack() {
                    //Image("swift").frame(width: 10, height: 19, alignment: .center)
                    Text("Swift")
                        .font(.largeTitle)
                        .background(Color.black)
                        .foregroundColor(.white)
                    Text("Objective -C")
                    .background(Color.yellow)
                    .foregroundColor(.purple)
                }
                
                HStack {
                    Text("Swift")
                    Divider()
                    Text("UI")
                    Divider()
                    Text("Study")
                    Divider()
                    Text("Slowly")
                }
            }
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}


