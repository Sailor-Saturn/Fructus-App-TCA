import SwiftUI

struct NutritientsView: View {
    let fruit: Fruit
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    var body: some View {
        GroupBox {
            DisclosureGroup("Nutritional Value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { nutrientIndex in
                    Divider().padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[nutrientIndex])
                        }
                        .foregroundStyle(fruit.gradientColors[1])
                        .font(Font.system(.body).bold())
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[nutrientIndex])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout){
    NutritientsView(fruit: .blueberry)
        .previewLayout(.fixed(width: 375, height: 480))
        .padding()
}
