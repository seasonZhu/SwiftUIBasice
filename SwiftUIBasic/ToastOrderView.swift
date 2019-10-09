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
    
    /// 不透明类型返回,其中可能会有逻辑判断,true时返回Text, false时返回TextView 目前这种是不允许的,就算是不透明类型,函数的返回类型必须是固定的,如果是Text,那么无论逻辑怎么判断,最后只能返回Text
    var body: some View {
        VStack {
            
            Text("牛油吐司").font(.title)
            ScrollableSelector(items: ["Menu 1", "Menu 2", "Menu 3", "Menu 4", "Menu 5", "Menu 6", "Menu 7", "Menu 8"])
            BorderedButton(text: "Add to wishlist",
                           systemImageName: "film",
                           color: .green,
                           action: {
                            print("点击事件")
            })
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(0 ..< 101) {
                        PopularityBadge(score: $0)
                    }.padding(.all, 4)
                }
            }
            
        }
    }
}

struct ToastOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ToastOrderView()
    }
}


/// 不透明类型只能作为函数的返回值,而不能作为入参进行使用
protocol Food {
    
}

struct Fish: Food {
    
}

struct Meat: Food {
    
}

protocol Animal {
    associatedtype FoodTyep: Food
    
    /// 其实这里的入参 我想写成 some Food 使用不透明类型 但是 会报错 其实我就写Food也没有什么错呀 只是针对不同的动物吃的食物无法具体化 不透明类型只能使用于函数返回
    func eat(food: FoodTyep)
    func greet(other: Self)
}
