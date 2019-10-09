//
//  BorderedButton.swift
//  SwiftUIBasic
//
//  Created by season on 2019/9/9.
//  Copyright © 2019 season. All rights reserved.
//

import Foundation
import SwiftUI

struct BorderedButton : View {
    let text: String
    let systemImageName: String
    let color: Color
    @State var isOn: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
            self.isOn = !self.isOn
        }, label: {
            HStack(alignment: .center, spacing: 4) {
                Image(systemName: systemImageName).foregroundColor(isOn ? .white : color)
                Text(text).foregroundColor(isOn ? .white : color)
            }
        })
            .padding(6)
            .background(RoundedRectangle(cornerRadius: 8)
                .stroke(color, lineWidth: isOn ? 0 : 2)
                .background(isOn ? color : .clear)
                .cornerRadius(8))
    }
}
