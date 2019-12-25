//
//  ContentView.swift
//  SwiftUIBasic
//
//  Created by season on 2019/8/23.
//  Copyright © 2019 season. All rights reserved.
//

import SwiftUI
import MapKit

/// 一个纯静态页面
struct ContentView: View {
    
    @State var isSettingPresented = false
        
    var body: some View {
        
        NavigationView {

            VStack {
                MapView()
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)

                CircleImage()
                    .offset(x: 0, y: -130)
                    .padding(.bottom, -130)
                    .onTapGesture(perform: imageTapAction)

                VStack(alignment: .leading) {
                    Text("Turtle Rock")
                        .font(.title)
                    HStack(alignment: .top) {
                        Text("Joshua Tree National Park")
                            .font(.subheadline)
                        Spacer()
                        Text("California")
                            .font(.subheadline)
                    }
                    
                    NavigationLink(destination: FunctionListView()) {
                        Text("FunctionListView")
                    }
                    
                }
                .padding()

                Spacer()
                
            }
            .navigationBarTitle("景点", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action:
                    {
                        self.isSettingPresented = true
                        print("右上按钮被点击了")
                        
                }) {
                HStack {
                    Image(systemName: "wrench")
                        .imageScale(.medium)
                    
                }
                .frame(width: 30, height: 30)
            })
                .sheet(isPresented: $isSettingPresented, onDismiss: {
                    print("Present出来的控制器即将消失")
                }, content: {
                    GridView()
                })
        }.onAppear {
            print("视图即将展现")
        }.onDisappear {
            NSLog("视图即将消失")
        }
    }
    
    func imageTapAction() {
        print("图片的点击事件")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
