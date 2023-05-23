import Foundation

struct Orders: Identifiable {
    var id = UUID()
    let positions: [Position]
    let user: User
}
