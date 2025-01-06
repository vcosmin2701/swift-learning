import Foundation

class GitHubNetworkService: ObservableObject {
    static let baseUrl = "https://api.github.com"
    
    func fetchUser(username: String) async throws -> GitHubUser {
        let endpoint = "\(Self.baseUrl)/users/\(username)"
        
        guard let url = URL(string: endpoint) else {
            throw GitHubError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw GitHubError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200:
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        case 404:
            throw GitHubError.userNotFound
        case 403:
            throw GitHubError.rateLimitExceeded
        default:
            throw GitHubError.invalidResponse
        }
    }
}
