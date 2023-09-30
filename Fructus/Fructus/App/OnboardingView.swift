//
//  FruitCardView.swift
//  Fructus
//
//  Created by Vera Dias on 30/09/2023.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(0..<5) { _ in 
                FruitCardView(fruit: .blueberry)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .padding(.vertical, 20)
    }
}

// MARK: - Preview
#Preview {
    OnboardingView()
}
