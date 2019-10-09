//
//  PopularityBadge.swift
//  SwiftUIBasic
//
//  Created by season on 2019/9/9.
//  Copyright © 2019 season. All rights reserved.
//

import Foundation
import SwiftUI

struct PopularityBadge : View {
    let score: Int
    
    @State var isDisplayed = false
    
    var scoreColor: Color {
        get {
            if score < 40 {
                return .red
            } else if score < 60 {
                return .orange
            } else if score < 75 {
                return .yellow
            }
            return .green
        }
    }
    
    var overlay: some View {
        ZStack {
            Circle()
              .stroke(Color.secondary, lineWidth: 2)
            Circle()
                .trim(from: 0,
                      to: isDisplayed ? CGFloat(score) / 100 : 0)
                .stroke(scoreColor, lineWidth: 2)
                .shadow(color: scoreColor, radius: 4)
                .animation(Animation.interpolatingSpring(stiffness: 60, damping: 10).delay(0.1))
        }
        .rotationEffect(.degrees(-90))
        .onAppear {
            self.isDisplayed = true
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.clear)
                .frame(width: 40)
                .overlay(overlay)
            Text("\(score)%")
                .font(Font.system(size: 10))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            }
            .frame(width: 40, height: 40)
    }
}
