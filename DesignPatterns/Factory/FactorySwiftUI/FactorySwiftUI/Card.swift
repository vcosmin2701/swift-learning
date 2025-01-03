import SwiftUI

protocol Card {
    associatedtype Content: View
    var title: String { get }
    var backgroundColor: Color { get }
    @ViewBuilder func cardContent() -> Content
}
