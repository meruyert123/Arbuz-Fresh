import Foundation

class CartViewModel: ObservableObject {
    static let shared = CartViewModel()
    private init() {}
    
    @Published var positions = [Position]()
    
    var cost: Int {
        var sum = 0
        for pos in positions {
            sum = sum + pos.cost
        }
        return sum
    }

    func updatePosition(_ position: Position) {
        if let index = positions.firstIndex(where: { $0.product == position.product }) {
            positions[index] = position
        }
    }
    
    func position(for product: Product) -> Position? {
        return positions.first(where: { $0.product == product })
    }
    
    func addPosition(_ position: Position) {
        positions.append(position)
    }
    
       func removePosition(for product: Product) {
           positions.removeAll { $0.product == product }
       }

}
