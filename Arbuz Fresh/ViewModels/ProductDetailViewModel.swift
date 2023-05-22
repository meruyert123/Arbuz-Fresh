import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    @Published var count = 0
    
    init(product: Product) {
        self.product = product
    }
}
