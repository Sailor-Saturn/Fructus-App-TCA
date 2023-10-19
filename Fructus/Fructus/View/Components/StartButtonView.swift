//
//  FruitCardView.swift
//  Fructus
//
//  Created by Vera Dias on 30/09/2023.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - Properties
    @State var action: () -> Void
    // MARK: - Body
    var body: some View {
        Button(action: action){
            HStack(spacing: 8){
                Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .tint(.white)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
        }
    }
}

// MARK: - Preview
#Preview {
    ZStack{
        Color.black
        StartButtonView(action: {})
    }
    .previewLayout(.sizeThatFits)
    .ignoresSafeArea()
}
