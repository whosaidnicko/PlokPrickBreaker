//
//  WaitingAnimationView.swift
//  PlokPrickBreaker
//
//  Created by Nicolae Chivriga on 24/02/2025.
//

import SwiftUI


import SwiftUI

struct WaitingAnimationView: View {
    @State private var animate = false
    @State private var rotation: Double = 0
    @Binding var show: Bool {
        didSet {
            let impactMed = UIImpactFeedbackGenerator(style: .heavy)
              impactMed.impactOccurred()
        }
    }
    // Customize these parameters as needed.
    let circleCount = 8
    let circleSize: CGFloat = 15
    let radius: CGFloat = 50
    
    var body: some View {
        if show {
            ZStack {
                // Create circleCount circles arranged evenly in a circle.
                ForEach(0..<circleCount, id: \.self) { index in
                    Circle()
                        .fill(Color(
                            hue: Double(index) / Double(circleCount),
                            saturation: 0.8,
                            brightness: 0.9
                        ))
                        .frame(width: circleSize, height: circleSize)
                    // Place each circle along the top, then rotate it into place.
                        .offset(y: -radius)
                    // Each circle pulses between a smaller and larger scale.
                        .scaleEffect(animate ? 1.0 : 0.5)
                        .rotationEffect(.degrees(Double(index) * (360.0 / Double(circleCount))))
                    // Stagger the pulse animation for each circle.
                        .animation(
                            Animation.easeInOut(duration: 0.8)
                                .repeatForever(autoreverses: true)
                                .delay(Double(index) * 0.1),
                            value: animate
                        )
                }
            }
            // Rotate the entire group continuously.
            .rotationEffect(.degrees(rotation))
            .onAppear {
                animate = true
                withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
        } else {
            
        }
    }
}
