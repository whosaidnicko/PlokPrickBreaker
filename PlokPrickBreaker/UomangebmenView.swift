//
//  UomangebmenView.swift
//  PlokPrickBreaker
//
//  Created by Nicolae Chivriga on 24/02/2025.
//

import SwiftUI
import StoreKit

struct UomangebmenView: View {
    @State var animateAllItems: Bool = false
    let topScreen: CGFloat = -UIScreen.main.bounds.height
    let rotate: Double = 360
    
    var body: some View {
        ZStack {
            Image("wofrumoskaneh")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                 Image("prikerourlogoti")
                    .offset(y: self.animateAllItems ? 0 : self.topScreen)
                    .animation(Animation.bouncy.delay(0.25), value: animateAllItems)
                
                NavigationLink {
                    Prunpiartgjoac()
                } label: {
                    Image("ceclascer")
                        .overlay {
                            Image("eitrujnsq")
                        }
                }
                    .scaleEffect(self.animateAllItems ? 1 : 0)
                    .animation(Animation.bouncy.delay(0.55), value: animateAllItems)
                    .padding(.top, 20)
                
                NavigationLink {
                    LegileJoculuBri()
                } label: {
                    Image("ofstarnge")
                        .overlay {
                            Text("Info")
                                .font(.system(size: 26, weight: .bold, design: .serif))
                                .foregroundStyle(Color.init(hex: "#BF4B03"))
                        }
                }

           
                    .scaleEffect(self.animateAllItems ? 1 : 0)
                    .animation(Animation.bouncy.delay(0.75), value: animateAllItems)
                    .padding(.top)
                
                Button {
                    if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                           
                            SKStoreReviewController.requestReview(in: windowScene)
                        }
                } label: {
                    Image("ofstarnge")
                        .overlay {
                            Text("Rate")
                                .font(.system(size: 26, weight: .bold, design: .serif))
                                .foregroundStyle(Color.init(hex: "#BF4B03"))
                        }
                }

                
                    .scaleEffect(self.animateAllItems ? 1 : 0)
                    .animation(Animation.bouncy.delay(1), value: animateAllItems)
                    .padding(.top)
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
        .onAppear() {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                let light = UIImpactFeedbackGenerator(style: .light)
                light.impactOccurred()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.65) {
                let light = UIImpactFeedbackGenerator(style: .rigid)
                light.impactOccurred()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
                let light = UIImpactFeedbackGenerator(style: .medium)
                light.impactOccurred()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                let light = UIImpactFeedbackGenerator(style: .heavy)
                light.impactOccurred()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.animateAllItems = true 
            }
            self.animateAllItems = true
        }
        
    }
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
import WebKit
struct WKWebViewRepresentable: UIViewRepresentable {
    typealias UIViewType = WKWebView

    var url: URL
    var webView: WKWebView
    var onLoadCompletion: (() -> Void)?
    

    init(url: URL, webView: WKWebView = WKWebView(), onLoadCompletion: (() -> Void)? = nil) {
        self.url = url
        self.webView = webView
        self.onLoadCompletion = onLoadCompletion
        self.webView.layer.opacity = 0 // Hide webView until content loads
    }

    func makeUIView(context: Context) -> WKWebView {
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        
        return webView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
        uiView.scrollView.isScrollEnabled = true
        uiView.scrollView.bounces = true
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
