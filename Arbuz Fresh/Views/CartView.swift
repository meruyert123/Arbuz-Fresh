import SwiftUI

struct CartView: View {
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.positions.isEmpty {
                VStack(alignment: .center, spacing: 8) {
                    Spacer()
                    Text("Ваша корзина пустая!")
                        .fontWeight(.medium)
                    Text("Добавьте в нее свои любимые фрукты, овощи и молочные продукты.")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .frame(width: 250)
            }
            else {
                VStack {
                    List(viewModel.positions, id: \.id) { position in
                        PositionCell(position: position)
                            .swipeActions {
                                Button {
                                    viewModel.positions.removeAll { pos in
                                        pos.product.name == position.product.name && pos.id == position.id
                                    }
                                } label: {
                                    Text("Удалить")
                                }.tint(.red)
                            }
                    }
                    HStack {
                        Text("Итого")
                        Spacer()
                        Text("\(self.viewModel.cost)")
                    }
                    HStack(spacing: 8) {
                        MainButton(title: "Отменить", color: .mainGreenColor)
                        MainButton(title: "Заказать", color: .mainGreenColor)
                    }
                }
                .listStyle(.plain)
                .navigationBarTitle("Корзина")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
