import SwiftUI


struct ProductDetailView: View {
    var viewModel: ProductDetailViewModel
    @State private var count: Int
    @State private var isAddedToCart = false
    @Environment(\.presentationMode) var presentationMode
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        _count = State(initialValue: CartViewModel.shared.position(for: viewModel.product)?.count ?? 0)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                VStack {
                    Image(viewModel.product.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                }
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        if viewModel.product.productType == ProductType.dairy.rawValue {
                            Text("\(viewModel.product.name), 1шт")
                                .fontWeight(.bold)
                                .font(.title2)
                                .lineLimit(2)
                        }
                        else {
                            Text("\(viewModel.product.name), 1кг")
                                .fontWeight(.bold)
                                .font(.title2)
                                .lineLimit(2)
                        }
                        Spacer()
                    }
                    if viewModel.product.itemsCount < 3 {
                        HStack {
                            PriceButton(title: "\(viewModel.product.price) тг", color: Colors.lightGreen.rawValue)
                            Spacer()
                            Text("В началии всего: \(viewModel.product.itemsCount-count)")
                                .font(.caption)
                                .foregroundColor(.red.opacity(0.8))
                        }
                    }
                    else {
                        PriceButton(title: "\(viewModel.product.price) тг", color: Colors.lightGreen.rawValue)
                    }
                }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Описание")
                            .foregroundColor(.gray)
                        Text("Бананы - отличный продукт. Ешь банан. Бананы - отличный продукт. Ешь банан. Бананы - отличный продукт. Ешь банан. Бананы - отличный продукт. Ешь банан.")
                            .font(.subheadline)
                    }
                if isAddedToCart {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                if count > 0 {
                                    count -= 1
                                }
                            }) {
                                Image(systemName: "minus.circle")
                                    .foregroundColor(.red)
                                    .font(.title)
                            }
                            Text("\(count) x \(viewModel.product.price)")
                                .font(.title3)
                                .frame(width: 100)
                            Button(action: {
                                if count < viewModel.product.itemsCount {
                                    count += 1
                                }
                            }) {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.green)
                                    .font(.title)
                            }
                            Spacer()
                            
                        }
                    }
                } else {
                    Button(action: {
                        count = 1
                        isAddedToCart = true
                    }) {
                        SecondaryButton(title: "Добавить в корзину", description: "\(viewModel.product.price)", color: Colors.mainGreenColor)
                    }
                }
            }
        }
        .onAppear {
            if let position = CartViewModel.shared.position(for: viewModel.product) {
                count = position.count
                isAddedToCart = true
            }
        }
        .onDisappear {
            let position = Position(product: viewModel.product, count: count)
            if count == 0 {
                CartViewModel.shared.removePosition(for: viewModel.product)
            } else if let existingPosition = CartViewModel.shared.position(for: viewModel.product) {
                CartViewModel.shared.updatePosition(position)
            } else {
                CartViewModel.shared.addPosition(position)
            }
        }
        .onChange(of: count) { newCount in
            if newCount == 0 {
                isAddedToCart = false
                count = 0
                let position = Position(product: viewModel.product, count: count)
                CartViewModel.shared.updatePosition(position)
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(
            product: Product(name: "Бананы", imageName: "banana", price: 1200, description: "", itemsCount: 1, backgroundColor: "", productType: "Молочные продукты", categoryType: "")))
        .padding(.horizontal, 16)
    }
}
