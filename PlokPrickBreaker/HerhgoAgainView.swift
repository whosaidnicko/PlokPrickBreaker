//
//  HerhgoAgainView.swift
//  PlokPrickBreaker
//
//  Created by Nicolae Chivriga on 24/02/2025.
//

import SwiftUI

struct HerhgoAgainView: View {
    @State var pognli: Bool = false
    @State var gopbye: Bool = false
    var body: some View {
        ZStack {
            Image("wofrumoskaneh")
                .resizable()
                .ignoresSafeArea()
            NavigationLink("", isActive: $pognli) {
                UomangebmenView()
            }
            VStack(spacing: 50) {
//                CulLoadingView()
                
                TextCulAn()
                    .offset(x: gopbye ? -UIScreen.main.bounds.width : 0)
                    .animation(Animation.bouncy, value: gopbye)
            }
            
        }
        .speadptiver()
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                self.gopbye = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    let impactMed = UIImpactFeedbackGenerator(style: .rigid)
                      impactMed.impactOccurred()
                    self.pognli = true
                }
            }
        }
    }
}
