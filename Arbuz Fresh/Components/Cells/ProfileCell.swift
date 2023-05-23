import SwiftUI

struct ProfileCell: View {
    var order: Orders
    
    var body: some View {
        VStack {
            NavigationLink {
                ForEach(order.positions, id: \.id) { position in
                    VStack {
                        VStack {
                            Text("Ваш заказ")
                            Text("\(order.positions.count) продукта")
                            ProfileProducCell(position: position)
                        }
                        VStack {
                            Text("Детали адреса")
                            HStack(spacing: 16) {
                                Image(systemName: "location")
                                Text("\(order.user.address)")
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            } label: {
                HStack {
                    Image(Images.onboarding.rawValue)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text("\(order.user.name)")
                        Text("Адрес: \(order.user.address)")
                        Spacer()
                        Text("Количество продуктов: \(order.positions.count)")
                    }
                    .frame(height: 100)
                    .foregroundColor(.black)
                    Spacer()
                }
                .padding(8)
                .background(Color(Colors.lightGray.rawValue))
                .cornerRadius(20)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct ProfileCell_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCell(order: Orders(positions: [Position(product: Product.mockData(), count: 12)], user: User(name: "Meri", address: "k", phoneNumber: "123456", entrance: "3", floor: "4", apartment: "2")))
    }
}

