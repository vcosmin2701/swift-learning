import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    @State private var username = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                userSearchField
                
                if viewModel.isLoading {
                    ProgressView()
                } else if username.isEmpty {
                    EmptyView()
                } else if let error = viewModel.error {
                    ErrorView(error: error)
                } else if let user = viewModel.user {
                    UserProfileView(user: user)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("GitHub Profile")
            .task {
                await viewModel.fetchUser(username: username)
            }
        }
    }
    
    private var userSearchField: some View {
        HStack {
            TextField("GitHub Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            Button("Search") {
                Task {
                    await viewModel.fetchUser(username: username)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
