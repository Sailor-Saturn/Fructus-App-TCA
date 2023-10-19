import SwiftUI
import ComposableArchitecture

struct FruiListView: View {
    // MARK: - Properties
    let store: StoreOf<FruiListReducer>
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                List {
                    ForEach(viewStore.fruits) { item in
                        NavigationLink(destination: DetailedListView(viewModel: item)){
                            FruitRowView(state: .init(id: item.id, fruit: item.fruit))
                                .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Detailed View")
        }
    }
}

struct FruiListReducer: Reducer {
    struct State: Equatable {
        var fruits: IdentifiedArrayOf<FruitViewModel>
    }
    
    enum Action {}
    
    var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}

struct DetailedListView_Previews: PreviewProvider {
    static var previews: some View {
        FruiListView(store:
                .init(
                    initialState:
                        FruiListReducer.State(fruits:
                                .init(
                                    uniqueElements:
                                        fruitsData.map({ fruit in
                                            FruitCardReducer.State(id: fruit.id, fruit: fruit)
                                        })
                                )
                        )
                ) {
                    FruiListReducer()
                })
    }
}
