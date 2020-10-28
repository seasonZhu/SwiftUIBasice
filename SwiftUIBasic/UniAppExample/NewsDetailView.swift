//
//  NewsDetailView.swift
//  SwiftUIBasic
//
//  Created by season on 2020/10/28.
//  Copyright © 2020 season. All rights reserved.
//

import SwiftUI

struct NewsDetailView: View {
    let news: News
    
    var body: some View {
        //let html = (news.content ?? "没有内容").htmlToString
        ScrollView {
            Text(news.content ?? "没有内容")
        }.navigationBarTitle(news.title ?? "没有标题")
        
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
