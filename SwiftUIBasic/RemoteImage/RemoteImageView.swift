//
//  RemoteImageView.swift
//  Landmarks
//
//  Created by Callum Trounce on 06/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public struct RemoteImageView: View {
    
    var url: URL
    
    var placeholder: Image?
    
    @State
    var remoteImage: RemoteImage = RemoteImage()
    
    public var body: some View {
        return (remoteImage.load(url: url).image ?? placeholder)?.resizable()
    }
    
    public init(url: URL, placeholder: Image? = nil) {
        self.placeholder = placeholder
        self.url = url
    }
    
    public init?(string: String, placeholder: Image? = nil ) {
        guard let url = URL(string: string) else { return nil }
        self.placeholder = placeholder
        self.url = url
    }
    
//    public func placeholder(@ViewBuilder _ content: () -> Image) -> Self {
//        let v = content()
//        var result = self
//        result.placeholder = v
//        return result
//    }
}
