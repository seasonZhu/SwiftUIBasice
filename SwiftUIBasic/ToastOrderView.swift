//
//  ToastOrderView.swift
//  SwiftUIBasic
//
//  Created by season on 2019/8/26.
//  Copyright © 2019 season. All rights reserved.
//

import SwiftUI
import QGrid

struct ToastOrderView: View {
    
    /// ObservedObject修饰的首先应该是一个class类型,具体可以移步看ObservedObject遵守的协议ObservableObject
    /// 它是一个只能由类遵守的协议另外这个状态应该和该定义的View的外部有联系,外部发生了变化后,导致内部ObservedObject的该值也变化,进而使得UI进行变化
    ///
    /// State修饰的首先应该是一个值类型,另外这个状态应该和该定义的View的外部没有关系,变化是在其内部进行产生的
    ///
    /// Binding修饰的首先应该是一个值类型,另外这个状态应该和该定义的View的外部有联系,外部发生了变化后,导致内部Binding的该值也变化,进而使得UI进行变化
    
    var imageNames = ["c#.png",
                      "html.png",
                      "java.png",
                      "js.png",
                      "php.png",
                      "react.png",
                      "ruby.png",
                      "swift.png",
                      "xcode.png"
                     ]
    
    var body: some View {
        NavigationView {
            VStack {
                //Spacer(minLength: 44)
                
                Text("牛油吐司").font(.title)
                
                QGrid(imageNames, columns: 3) { imageName in
                    VStack {
                        Image(uiImage: UIImage(named: imageName)!)
                            .resizable()
                            .frame(width: 100, height: 100)
                        .onTapGesture {
                            self.pushTo(imageName: imageName)
                        }
                        
                        Button(action: {
                            self.pushTo(imageName: imageName)
                        }) {
                            Text(imageName).foregroundColor(.red)
                        }
                    }
                }
            }

        }
    }
    
    func pushTo(imageName: String) {
        print("如何不依赖NavigationLink去push呢")
    }
}

struct PictureView: View {
    
    let imageName: String
    
    var body: some View {
        NavigationView {
            Image(uiImage: UIImage(named: self.imageName)!)
        }
    }
}

extension String: Identifiable {
    public var id: Int {
        hashValue
    }
}

struct ToastOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ToastOrderView()
    }
}
