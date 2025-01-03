import Foundation

enum CardType {
    case news(headline: String, summary: String)
    case product(name: String, price: Double, imageUrl: String)
}
