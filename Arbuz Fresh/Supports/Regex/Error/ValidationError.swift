import Foundation

enum ValidationError: Error {
    case custom(message: String)
}

extension ValidationError {
    var errorDescription: String {
        switch self {
        case .custom(message: let message):
             return message
        }
    }
}
