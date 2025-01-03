import SwiftUI

struct CardView<Model: Card>: View {
    let model: Model
    
    var body: some View {
        VStack {
            Text(model.title)
                .font(.title2)
                .bold()
            
            model.cardContent()
        }
        .frame(maxWidth: .infinity)
        .background(model.backgroundColor.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
