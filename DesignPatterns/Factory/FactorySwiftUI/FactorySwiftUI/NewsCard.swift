import SwiftUI

struct NewsCard: Card {
    let title: String = "News"
    let backgroundColor: Color = .blue
    let headline: String
    let summary: String
    
    func cardContent() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(headline)
                .font(.headline)
            Text(summary)
                .font(.subheadline)
                .foregroundStyle(.red)
        }
        .padding()
    }
}
