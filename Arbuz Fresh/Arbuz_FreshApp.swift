import SwiftUI

@main
struct Arbuz_FreshApp: App {
    let parserViewModel = ParserViewModel() //
    @AppStorage("isOnboarding") private var isOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
                    .environmentObject(parserViewModel)
            } else {
                BottomNavigationBar()
                    .environmentObject(parserViewModel)
            }
        }
        
    }
}
