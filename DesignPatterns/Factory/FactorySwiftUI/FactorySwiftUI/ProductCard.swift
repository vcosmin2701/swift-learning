import SwiftUI

struct ProductCard: Card {
    let title: String = "Product"
    let backgroundColor: Color = .green
    let productName: String
    let price: Double
    let imageUrl: String
    
    func cardContent() -> some View {
        VStack {
            Rectangle()
                .fill(.gray)
                .frame(height: 100)
            Text(productName)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .padding()
    }
}
