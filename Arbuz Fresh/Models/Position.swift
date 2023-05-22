import Foundation

struct Position: Identifiable {
    var id = UUID()
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
}
