//
//  SplashView.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            MainTabView()
        } else {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [
                        Color(red: 0.95, green: 0.95, blue: 0.97),
                        Color(red: 0.98, green: 0.97, blue: 0.95)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Buddhist symbol or icon
                    ZStack {
                        // Outer circle with gradient
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.85, green: 0.75, blue: 0.55),
                                        Color(red: 0.75, green: 0.65, blue: 0.45)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 140, height: 140)
                            .shadow(color: Color.black.opacity(0.15), radius: 25, x: 0, y: 12)
                        
                        // Inner circle
                        Circle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 100, height: 100)
                        
                        // Dharma wheel or lotus symbol
                        ZStack {
                            // Eight-spoked wheel
                            ForEach(0..<8) { index in
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.white)
                                    .frame(width: 4, height: 35)
                                    .offset(y: -20)
                                    .rotationEffect(.degrees(Double(index) * 45))
                            }
                            
                            // Center circle
                            Circle()
                                .fill(Color.white)
                                .frame(width: 20, height: 20)
                        }
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    
                    // App name
                    Text("Buddha")
                        .font(.system(size: 42, weight: .light, design: .serif))
                        .foregroundColor(Color(red: 0.3, green: 0.25, blue: 0.2))
                        .opacity(opacity)
                    
                    // Subtitle
                    Text("Wisdom for Daily Life")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color(red: 0.5, green: 0.45, blue: 0.4))
                        .opacity(opacity)
                }
            }
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 1.0
                    self.opacity = 1.0
                }
                
                // Transition to main view after delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

