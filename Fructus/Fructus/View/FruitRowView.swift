import ComposableArchitecture
import SwiftUI

struct FruitRowView: View {
    let store: StoreOf<FruitRowReducer>
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack{
                HStack {
                    Image(viewStore.fruit.image)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80, alignment: .center)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 3, x: 2, y: 2)
                        .background(LinearGradient(gradient: Gradient(colors: viewStore.fruit.gradientColors), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(viewStore.fruit.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(viewStore.fruit.headline)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

struct FruitRowReducer: Reducer {
    struct State: Equatable, Identifiable {
        let id: UUID
        var fruit: Fruit
    }
    
    enum Action {}
    
    var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}
#Preview {
    FruitRowView(store: .init(initialState: FruitRowReducer.State(id: Fruit.blueberry.id, fruit: .blueberry)){
        FruitRowReducer()
    })
}
