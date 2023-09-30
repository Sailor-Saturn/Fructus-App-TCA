import SwiftUI

@main
struct FructusApp: App {
    var body: some Scene {
        WindowGroup {
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
        }
    }
}
