//
//  CulLoadingView.swift
//  PlokPrickBreaker
//
//  Created by Nicolae Chivriga on 24/02/2025.
//

import SwiftUI

import SwiftUI

struct CulLoadingView: View {
    // Toggle to start the animation.
    @State private var animate = false
    // Customize circle parameters.
    let circleCount = 4
    let circleSize: CGFloat = 20
    let spacing: CGFloat = 15

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<circleCount, id: \.self) { index in
                Circle()
                    // When animating, use a hue based on the index to vary the colors.
                    .fill(animate ? Color(hue: Double(index) / Double(circleCount), saturation: 0.8, brightness: 1.0) : Color.gray)
                    .frame(width: circleSize, height: circleSize)
                    // Scale effect gives a “pulse” feel.
                    .scaleEffect(animate ? 1.3 : 0.7)
                    // Horizontal offset gives the impression of motion.
                    .offset(x: animate ? 10 : -10)
                    // Each circle’s animation is delayed so they animate sequentially.
                    .animation(
                        Animation.easeInOut(duration: 0.8)
                            .repeatForever(autoreverses: true)
                            .delay(Double(index) * 0.2),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate = true
        }
    }
}



struct Swiper: ViewModifier {
    var onDismiss: () -> Void
    @State private var offset: CGSize = .zero

    func body(content: Content) -> some View {
        content
//            .offset(x: offset.width)
            .animation(.interactiveSpring(), value: offset)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                                      self.offset = value.translation
                                  }
                                  .onEnded { value in
                                      if value.translation.width > 70 {
                                          onDismiss()
                                  
                                      }
                                      self.offset = .zero
                                  }
            )
    }
}
