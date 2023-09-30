import SwiftUI
import ComposableArchitecture

/// Important Stuff on this View
/// Animation on image when the screen appears
/// Each component has a slight shadow
/// Images imported have transparent background
struct FruitCardView: View {
    // MARK: - Properties
    let store: StoreOf<FruitCardReducer>
    @State var isAnimating: Bool = false
    
    // MARK: - Body
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack{
                VStack(spacing: 20){
                    Image(viewStore.fruit.image)
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                        .scaleEffect(isAnimating ? 1.0 : 0.6)
                    Text(viewStore.fruit.title)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15),radius: 2, x: 2, y: 2)
                    
                    Text(viewStore.fruit.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: 480)
                    
                    StartButtonView()
                }
            }
            .onAppear() {
                withAnimation(.easeInOut(duration: 2.5)) {
                    isAnimating = false
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: viewStore.fruit.gradientColors), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .padding(.horizontal, 20)
        }
    }
}

// MARK: Reducer
struct FruitCardReducer: Reducer {
    struct State: Equatable, Identifiable {
        let id: UUID
        var fruit: Fruit
    }
    
    enum Action {
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            }
        }
    }
}

// MARK: - Preview
#Preview {
    FruitCardView(store: .init(initialState: FruitCardReducer.State(id: Fruit.blueberry.id, fruit: .blueberry)){
        FruitCardReducer()
    })
}
