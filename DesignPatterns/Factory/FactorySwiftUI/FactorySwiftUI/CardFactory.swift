import SwiftUI

struct CardFactory {
    @ViewBuilder
    static func createCard(type: CardType) -> some View {
        switch type {
        case .news(let headline, let summary):
            CardView(model: NewsCard(headline: headline, summary: summary))
        case .product(let name, let price, let imageUrl):
            CardView(model: ProductCard(productName: name, price: price, imageUrl: imageUrl))
        }
    }
}
