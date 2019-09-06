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
    
    var body: some View {
        VStack {
            
            Text("牛油吐司").font(.title)
        }
    }
}

struct ToastOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ToastOrderView()
    }
}
