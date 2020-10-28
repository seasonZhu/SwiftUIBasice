//
//  NewsDetailView.swift
//  SwiftUIBasic
//
//  Created by season on 2020/10/28.
//  Copyright © 2020 season. All rights reserved.
//

import SwiftUI
import WebKit

struct NewsDetailView: View {
    let news: News
    
    var body: some View {
        webView().padding([.leading, .trailing], 5)
    }
    
    func webView() -> some View {
        let wkWebView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        wkWebView.loadHTMLString(news.content ?? "", baseURL: nil)
        return WebView(webView: wkWebView).navigationBarTitle(news.title ?? "没有标题")
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
