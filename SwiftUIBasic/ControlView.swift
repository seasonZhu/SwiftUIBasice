//
//  ControlView.swift
//  SwiftUIBasic
//
//  Created by season on 2019/12/11.
//  Copyright © 2019 season. All rights reserved.
//

import SwiftUI

struct ControlView: View {
    /// 开关状态绑定值
    @State var isShowing = true
    
    @State var password = "123"
    
    @State var value: Double = 0 // create State
    
    @State var favoriteColor = 0
    
    @State var count:Int = 0
    
    var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                Toggle(isOn: $isShowing) {
                    Text("A switch")
                }.padding() // 这个padding()对布局的美观度有影响
                
                TextField("placeholder", text: $password, onEditingChanged: { (isChanged) in
                    print(isChanged)
                }) {
                    print("提交")
                }.padding()
                
                SecureField("password", text: $password)
                .padding()
                
                Button(action: {
                    print("按钮的点击事件")
                }) { Text("Ruby")
                }
                
                Slider(value: $value, in: 0...100, label: { Text("Value is \(value)") }
                ).padding()
                
                Stepper(
                    onIncrement: { self.count += 1 },
                    onDecrement: { self.count -= 1 },
                    label: { Text("Count is \(count)") }
                ).padding()
                
            }
        }
        
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView()
    }
}
