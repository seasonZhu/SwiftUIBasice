//
//  ActivityIndicatorView.swift
//  SwiftUIBasic
//
//  Created by season on 2020/10/28.
//  Copyright © 2020 season. All rights reserved.
//

import SwiftUI


/**
 A view that shows that a task is in progress.
 */
public struct ActivityIndicatorView: View {
    /// Background color behind the indicator. This appears in a circle behind the activity view.
    private var backgroundColor: Color
    /// The color of the activity indicator. This is in a gradient that fades to `.white`.
    private var foregroundColor: Color
    
    /// Total number of dashes visible in the indicator.
    private var totalDashes = 12
    
    /// Time to complete a single revolution. In seconds.
    private(set) var period: Double
    
    /// Radial offset. State property used to animate the view.
    @State private var radialOffset: Double = 0
    
    private var dashViews: some View {
        GeometryReader { proxy in
            ForEach(0..<self.totalDashes) { index in
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: proxy.size.width * 4 / 75, height: proxy.size.height / 5)
                    .position(x: proxy.size.width / 2, y: proxy.size.height / 5)
                    .rotationEffect(.degrees(360 * Double(index) / Double(self.totalDashes)))
            }
        }
    }

    
    /**
     Initializes a new `LoadingIndicatorView`.
     
     - parameter backgroundColor: The background color behind the indicator. This will appear in a circle behind the view. If none is set, defaults to `.clear`.
     - parameter foregroundColor: The color of the activity indicator. If none is set, defaults to `.gray`.
     - parameter period: How long it takes for the view to complete one complete rotation. In seconds. Defaults to `1`.
     */
    public init(backgroundColor: Color = .clear, foregroundColor: Color = .gray, period: Double = 1) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.period = period
    }
    
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(backgroundColor)
            
            AngularGradient(gradient: .init(colors: [.white, foregroundColor]), center: .center)
                .rotationEffect(.degrees(radialOffset))
                .animation(Animation.linear(duration: period).repeatForever(autoreverses: false))
                .mask(self.dashViews)
        }
        .scaledToFit()
        .onAppear {
            self.radialOffset = 360
        }
    }
}


struct LoadingIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ActivityIndicatorView(backgroundColor: .red)
            .frame(width: 40, height: 40)
            .previewLayout(.sizeThatFits)
            
            ActivityIndicatorView(backgroundColor: .blue)
            .frame(width: 75, height: 75)
            .previewLayout(.sizeThatFits)
            
            ActivityIndicatorView(backgroundColor: .red, foregroundColor: .blue)
            .frame(width: 150, height: 150)
            .previewLayout(.sizeThatFits)
            
            ActivityIndicatorView(backgroundColor: .red)
            .frame(width: 20, height: 100)
            .previewLayout(.sizeThatFits)
            
            ActivityIndicatorView(backgroundColor: .red)
            .frame(width: 100, height: 20)
            .previewLayout(.sizeThatFits)
        }
    }
}

public extension View {
    /**
     Adds an activity indicator to this view.
     
     This adds a default `ActivityIndicatorView` overlay with a max frame of 50 by 50.
     
     - parameter isVisible: Whether or not the activity indicator is visible
     */
    func activityIndicator(isVisible: Bool) -> some View {
        self.activityIndicator(isVisible: isVisible) {
            ActivityIndicatorView()
        }
    }
    
    /**
    Adds an activity indicator to this view.
     
     The activity indicator is added as an overlay with a max frame of 50 by 50.
    
    - parameter isVisible: Whether or not the activity indicator is visible
    - parameter indicator: The indicator to overlay on this view
    */
    func activityIndicator(isVisible: Bool, @ViewBuilder indicator: @escaping () -> ActivityIndicatorView) -> some View {
        Group {
            if isVisible {
                self
                    .overlay(indicator().frame(maxWidth: 50, maxHeight: 50))
            } else {
                self
            }
        }
    }
}

