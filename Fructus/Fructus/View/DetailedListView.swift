import SwiftUI

struct DetailedListView: View {
    var viewModel: FruitViewModel // TODO: Maybe I can just send the fruit here? I think I don't need the id
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStackLayout(alignment: .center, spacing: 20){
                    HeaderDetailedView(fruit: viewModel.fruit)
                    VStackLayout(alignment: .leading, spacing: 20){
                        
                        Text( viewModel.fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(viewModel.fruit.gradientColors[1 ])
                        
                        Text( viewModel.fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        NutritientsView(fruit: viewModel.fruit)
                        
                        Text( "Learn More About \(viewModel.fruit.title)")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        Text(viewModel.fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        SourceLinkView(fruitName: viewModel.fruit.title)
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }
                .navigationTitle(viewModel.fruit.title)
                .navigationBarTitleDisplayMode(.inline)
            }
            .edgesIgnoringSafeArea(.top
            )
        }
    }
}

#Preview {
    DetailedListView(viewModel: .init(id: Fruit.blueberry.id, fruit: .blueberry))
}
