import SwiftUI

struct CaregoryCard: View {
    let title: String
    let imageStr: String
    let color: String
    
    var body: some View {
        HStack {
            VStack {
                Text(title)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(20)
            Spacer()
        }
        .frame(height: 135)
        .background(Color(color))
            .overlay(content: {
            Image(imageStr)
                .resizable()
                .scaledToFill()
        })
        .cornerRadius(20)
    }
}

struct CaregoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CaregoryCard(title: "Фрукты", imageStr: "fruitsMainPhoto", color: Colors.lightGray.rawValue)
    }
}
