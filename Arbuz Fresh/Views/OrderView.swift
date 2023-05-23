import SwiftUI

struct OrderView: View {
    
    @StateObject private var contentBuilder = FormContentBuilderImpl()
    let viewModel: CartViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Выбрать день недели")
                Text("Выбрать период времени")
            }
            Text("Указать данные")
            ForEach(contentBuilder.content) { component in
                switch component {
                case is TextFormComponent:
                    TextFieldButton(component: component as! TextFormComponent)
                        .environmentObject(contentBuilder)
                case is ButtonFormComponent:
                    ButtonFormView(component: component as! ButtonFormComponent) { id in
                        switch id {
                        case .submit:
                            contentBuilder.validate()
                        default:
                            break
                        }
                    }
                default:
                    HomeView()
                }
            }
            .padding(.horizontal, 16)
            .navigationBarTitle("Оформление заказа")
            VStack {
                Text("Выбрать срок подписки")
            }
        }
        .onChange(of: contentBuilder.state ){ state in
            switch state {
            case .valid(let user):
                print(user)
                print("SUCC")
                viewModel.placeOrder(user: user)
                presentationMode.wrappedValue.dismiss()
            case .fail(_):
                print("fail")
            case .none:
                break
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: CartViewModel.shared)
    }
}
