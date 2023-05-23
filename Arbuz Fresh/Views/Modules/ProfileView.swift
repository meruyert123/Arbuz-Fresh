import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            // юзер карточка
            if viewModel.ordersList.isEmpty {
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
                ScrollView {
                    VStack(spacing: 20) {
                        VStack(spacing: 8) {
                            ForEach(viewModel.ordersList) { order in
                                ProfileCell(order: order)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .navigationBarTitle("Ваша подписка")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: CartViewModel.shared)
    }
}
