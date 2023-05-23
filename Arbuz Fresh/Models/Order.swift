import Foundation

struct Orders: Identifiable {
    var id = UUID()
    let positions: [Position]
    let user: User
    let dayOfWeek: String
    let timeInterval: String
    let subscriptionPeriod: String
}
