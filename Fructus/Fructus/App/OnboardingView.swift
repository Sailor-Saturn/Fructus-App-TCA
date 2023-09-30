import ComposableArchitecture
import SwiftUI

struct OnboardingView: View {
    // MARK: - Properties
    let store: StoreOf<OnboardingReducer>
    // MARK: - Body
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView {
                ForEachStore(self.store.scope(state: \.fruits, action: { .fruit(id: $0, action: $1)})) { store in
                    FruitCardView(store: store)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .padding(.vertical, 20)
        }
    }
}

// MARK: Reducer
struct OnboardingReducer: Reducer {
    struct State: Equatable {
        var fruits: IdentifiedArrayOf<FruitCardReducer.State>
    }
    
    enum Action {
        case fruit(id: Fruit.ID, action: FruitCardReducer.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fruit(_, _):
                return .none
            }
        }
        .forEach(\.fruits, action: /Action.fruit(id:action:)){
            FruitCardReducer()
        }
    }
}

// MARK: - Preview
#Preview {
    OnboardingView(store:
            .init(
                initialState:
                    OnboardingReducer.State(fruits:
                            .init(
                                uniqueElements:
                                    fruitsData.map({ fruit in
                                        FruitCardReducer.State(id: fruit.id, fruit: fruit)
                                    })
                            )
                    )
            ) {
                OnboardingReducer()
            })
}
