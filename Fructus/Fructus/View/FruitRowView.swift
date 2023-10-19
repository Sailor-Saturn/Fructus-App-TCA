import ComposableArchitecture
import SwiftUI

struct FruitRowView: View {

    var state: FruitViewModel
    
//    let store: StoreOf<FruitRowReducer>
    var body: some View {
//        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack{
                HStack {
                    Image(state.fruit.image)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80, alignment: .center)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 3, x: 2, y: 2)
                        .background(LinearGradient(gradient: Gradient(colors: state.fruit.gradientColors), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(state.fruit.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(state.fruit.headline)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
//        }
    }
}

#Preview {
    FruitRowView(state: .init(id: Fruit.blueberry.id, fruit: .blueberry))
}
