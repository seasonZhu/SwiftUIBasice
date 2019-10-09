//
//  ScrollableSelector.swift
//  SwiftUIBasic
//
//  Created by season on 2019/9/9.
//  Copyright © 2019 season. All rights reserved.
//

import Foundation
import SwiftUI

/// 改写自MovieSwift中的组件 将Binding改为State
struct ScrollableSelector: View {
    let items: [String]
    @State var selection: Int = 0
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 12) {
                ForEach(0 ..< items.count) {
                    self.text(for: $0).tag($0)
                }
            }
            .padding([.leading, .trailing], 10)
        }
        .frame(height: 36)
        .background(Color.gray)
        .cornerRadius(8)
    }
    
    private func text(for index: Int) -> some View {
        Group {
            if index == selection {
                Text(items[index])
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding(4)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .onTapGesture {
                        self.selection = index
                }
                .fixedSize()
            }else {
                Text(items[index])
                    .font(.headline)
                    .foregroundColor(.primary)
                    .onTapGesture {
                        self.selection = index
                }
                .fixedSize()
            }
        }
    }
}
