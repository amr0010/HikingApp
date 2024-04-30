//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by Amr Magdy on 30/04/2024.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            Color.customIndigoMedium,
                            Color.customSalmonLight
                        ],
                        startPoint: isAnimateGradient ? .bottomLeading : .topLeading,
                        endPoint:  isAnimateGradient ? .topTrailing : .bottomTrailing
                    )
                )
                .onAppear {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
                }
           MotionAnimationView()
        }
        .frame(width: 256, height: 256)

    }
}

#Preview {
    CustomCircleView()
}
