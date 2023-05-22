import SwiftUI

struct PositionCell: View {
    let position: Position
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        HStack(spacing: 4) {
            VStack(alignment: .center) {
                Image(position.product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
            }
            .padding(.leading, 10)
            Spacer()
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(position.product.name)")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        if position.product.productType == ProductType.dairy.rawValue {
                            Text("\(position.count) шт x \(position.product.price)")
                                .font(.caption)
                                .foregroundColor(Color.secondary)
                        }
                        else {
                            Text("\(position.count) кг x \(position.product.price)")
                                .font(.caption)
                                .foregroundColor(Color.secondary)
                        }
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    VStack {
                        Text("\(position.cost)")
                            .font(.caption)
                            .padding(6)
                            .background(Color(Colors.lightGray.rawValue))
                            .cornerRadius(8)
                    }
                    Spacer()
                }
            }
            .padding(.vertical, 10)
            .padding(.trailing, 10)
        }
        .frame(height: 100)
        .background(Color(Colors.lightGray.rawValue))
        .cornerRadius(16)
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(
            product: Product(name: "Бананы", imageName: "banana", price: 12, description: "", itemsCount: 1, backgroundColor: "", productType: "", categoryType: ""), count: 20))
    }
}
