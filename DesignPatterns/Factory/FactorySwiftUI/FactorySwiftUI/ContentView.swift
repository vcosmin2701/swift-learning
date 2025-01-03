import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CardFactory.createCard(
                    type: .news(
                        headline: "Breaking News!",
                        summary: "Swift is a wonderful language")
                )
                
                CardFactory.createCard(
                    type: .product(
                        name: "Freak Hoodie",
                        price: 99.99,
                        imageUrl: "freak in hoodie")
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
