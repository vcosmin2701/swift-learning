import SwiftUI

struct UserProfileView: View {
    let user: GitHubUser
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: user.avatarUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundStyle(.secondary)
            }
            .frame(width: 120, height: 120)
            
            Text(user.login)
                .bold()
                .font(.title3)
            
            Text(user.bio)
                .padding()
        }
    }
}
