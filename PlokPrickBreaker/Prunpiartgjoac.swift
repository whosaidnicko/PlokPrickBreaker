//
//  Prunpiartgjoac.swift
//  PlokPrickBreaker
//
//  Created by Nicolae Chivriga on 24/02/2025.
//


import SwiftUI


struct Prunpiartgjoac: View {
    @State var showh: Bool = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("culocafneih")
                .resizable()
            
                .ignoresSafeArea()
            
            WaitingAnimationView(show: $showh)
                .frame(width: 150, height: 150)
            WKWebViewRepresentable(url: URL(string: "https://plays.org/game/brick-breaker/")!) {
                self.showh = false 
            }
                .padding()
                .cornerRadius(100)
                
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: nazadposhli(nazadAction: {
            dismiss()
        }))
    }
}


func nazadposhli(nazadAction: @escaping() -> Void) -> some View {
    Button {
        nazadAction()
    } label: {
        Image("onidetnazda")
    }

  
}
