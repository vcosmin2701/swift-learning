import Foundation

class UserViewModel: ObservableObject {
    @Published private(set) var user: GitHubUser?
    @Published private(set) var error: GitHubError?
    @Published private(set) var isLoading = false
    
    private let service = GitHubNetworkService()
    
    func fetchUser(username: String) async {
        isLoading = true
        error = nil
        
        do {
            user = try await service.fetchUser(username: username)
        } catch let error as  GitHubError {
            self.error = error
        } catch {
            self.error = .invalidResponse
        }
        
        isLoading = false
    }
}
