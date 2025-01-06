import Foundation

enum GitHubError: LocalizedError {
    case invalidUrl
    case invalidResponse
    case invalidData
    case userNotFound
    case rateLimitExceeded
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The URL provided is invalid"
        case .invalidResponse:
            return "The server returned an invalid response."
        case .invalidData:
            return "Data received was invalid."
        case .userNotFound:
            return "The requested user was not found."
        case .rateLimitExceeded:
            return "GitHub API rate limit exceeded."
        }
    }
}
