import SwiftUI

struct ProfileDetailView: View {
    var order: Orders
    
    var body: some View {
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
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView(order: Orders(positions: [Position(product: Product.mockData(), count: 12)], user: User(name: "Meri", address: "Jmkfcjewfjo", phoneNumber: "123456", entrance: "3", floor: "4", apartment: "2"), dayOfWeek: "", timeInterval: "", subscriptionPeriod: ""))
    }
}
