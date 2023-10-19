import SwiftUI

// TODO: Improve Navigation in this View by adding a store
@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
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
                        }
                )
            } else {
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
                        }
                )
            }
        }
    }
}
