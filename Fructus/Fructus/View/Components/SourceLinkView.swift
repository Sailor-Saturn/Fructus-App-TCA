import SwiftUI

struct SourceLinkView: View {
    let fruitName: String
    
    init(fruitName: String) {
        self.fruitName = fruitName.replacingOccurrences(of: " ", with: "_")
    }
    
    var body: some View {
        GroupBox {
            HStack {
                Text("Content Source")
                Spacer()
                Link("Wikipedia",destination: URL(string: "https://wikipedia.com/\(fruitName)")!)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout){
    SourceLinkView(fruitName: "strawberry")
        .padding()
}
