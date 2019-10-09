//
//  UserDetaultWrapper.swift
//  SwiftUIBasic
//
//  Created by season on 2019/9/6.
//  Copyright © 2019 season. All rights reserved.
//

import Foundation

/// 出自开源项目 MovieSwift
/// @修饰符的本质 和系统的@State/@Binding 其实是一样的意思 目前还不知道如何灵活运用

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct AppUserDefaults {
    @UserDefault("user_region", defaultValue: Locale.current.regionCode ?? "US")
    static var region: String
        
    @UserDefault("original_title", defaultValue: false)
    static var alwaysOriginalTitle: Bool
}

