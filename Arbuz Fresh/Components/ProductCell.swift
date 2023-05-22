import SwiftUI

struct ProductCell: View {
    var product: Product
    
    var body: some View {
        VStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 6) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding(.top, 16)
                    .padding(8)
                if product.name.contains(" ") {
                    Text("\(product.name)")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                else {
                    Text("\(product.name)\n")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                if product.productType == ProductType.dairy.rawValue {
                    Text("\(product.price)тг/ 1шт")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                }
                else {
                    Text("\(product.price)тг/ 1кг")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                }
            }
            .padding(.horizontal, 8)
            if product.itemsCount == 0 {
                VStack(alignment: .center) {
                    Text("Нет в наличии")
                        .font(.caption)
                        .foregroundColor(Color(.red).opacity(0.7))
                        .frame(maxWidth: .infinity)
                }
                .padding(2)
                .background(.white)
                .cornerRadius(12)
                .padding(.horizontal, 4)
                .padding(.bottom, 4)
            }
            else {
                VStack(alignment: .center) {
                    Text("\(product.price) тг")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                }
                .padding(3)
                .background(.white)
                .cornerRadius(12)
                .padding(.horizontal, 4)
                .padding(.bottom, 4)
            }
        }
        .background(product.itemsCount == 0 ? Color(Colors.lightGray.rawValue) : Color(product.backgroundColor))
        .cornerRadius(16)
        .frame(maxWidth: .infinity)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(name: "Бананы Бананы", imageName: "banana", price: 19087, description: "", itemsCount: 1, backgroundColor: "lightGreen", productType: "Молочные продукты", categoryType: ""))
    }
}
