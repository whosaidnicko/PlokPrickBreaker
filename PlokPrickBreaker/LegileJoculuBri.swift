//
//  LegileJoculuBri.swift
//  PlokPrickBreaker
//
//  Created by Nicolae Chivriga on 24/02/2025.
//

import SwiftUI

struct LegileJoculuBri: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("wofrumoskaneh")
                .resizable()
                .ignoresSafeArea()
            Image("starngroiu")
                .resizable()
                .scaledToFit()
                .padding(20)
                .overlay {
                    Text("Destroy all blocks by hitting them with the ball. Each block requires the number of hits shown on it to break. Control the paddle  , launch the ball with a tap. When hit, the block’s number decreases—once it hits zero, the block breaks. Avoid missing: if the ball falls, the level restarts.")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black)
                        .padding(30)
                }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: nazadposhli {
            self.dismiss()
        })
    }
}
@preconcurrency import WebKit
import SwiftUI
import WebKit
extension WKWebViewRepresentable {
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: WKWebViewRepresentable
        private var popupWebViews: [WKWebView] = []

        init(_ parent: WKWebViewRepresentable) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            // Handle popup windows
            guard navigationAction.targetFrame == nil else {
                return nil
            }

            let popupWebView = WKWebView(frame: .zero, configuration: configuration)
            popupWebView.uiDelegate = self
            popupWebView.navigationDelegate = self

            parent.webView.addSubview(popupWebView)

            popupWebView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                popupWebView.topAnchor.constraint(equalTo: parent.webView.topAnchor),
                popupWebView.bottomAnchor.constraint(equalTo: parent.webView.bottomAnchor),
                popupWebView.leadingAnchor.constraint(equalTo: parent.webView.leadingAnchor),
                popupWebView.trailingAnchor.constraint(equalTo: parent.webView.trailingAnchor)
            ])

            popupWebViews.append(popupWebView)
            return popupWebView
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Notify when the main page finishes loading
            parent.onLoadCompletion?()
            parent.webView.layer.opacity = 1 // Reveal the webView
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }

        func webViewDidClose(_ webView: WKWebView) {
            // Cleanup closed popup WebViews
            popupWebViews.removeAll { $0 == webView }
            webView.removeFromSuperview()
        }
    }
}
