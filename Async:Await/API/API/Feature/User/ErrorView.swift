import SwiftUI

struct ErrorView: View {
    let error: GitHubError
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundColor(.red)
            Text(error.errorDescription ?? "Unknown error")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

