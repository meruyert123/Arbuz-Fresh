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
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(order.user.name)")
                            .padding(.top, 4)
                        Spacer()
                        HStack(spacing: 4) {
                            Image(systemName: "mappin")
                            Text("\(order.user.address)")
                        }
                        .font(.caption)
                        .padding(.bottom, 8)
                    }
                    .frame(height: 70)
                    .foregroundColor(.black)
                    Spacer()
                    VStack {
                        Text("\(order.positions[0].cost)")
                            .fontWeight(.medium)
                            .padding(5)
                            .cornerRadius(6)
                            .padding(.bottom, 10)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.top, 2)
                    .frame(width: 70, height: 70)
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
        ProfileCell(order: Orders(positions: [Position(product: Product.mockData(), count: 12)], user: User(name: "Meri", address: "Jmkfcjewfjo", phoneNumber: "123456", entrance: "3", floor: "4", apartment: "2")))
    }
}

