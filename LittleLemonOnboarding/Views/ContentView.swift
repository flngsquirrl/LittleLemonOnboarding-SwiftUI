//
//  ContentView.swift
//  LittleLemonOnboarding
//
//  Created by flngsquirrl on 02/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(UserContext.self) private var userContext

    private static var tabTransition = AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .opacity)
    private static var onboardingTransition = AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .opacity)

    var body: some View {
        if userContext.isUserRegistered {
            TabView {
                FilterableMenuView().tabItem { Label("Menu", systemImage: "list.bullet.rectangle") }
                ProfileView(user: userContext.user!, onChange: saveUser, onLogout: logout).tabItem { Label("Profile", systemImage: "person.circle") }
            }
            .transition(Self.tabTransition)
        } else {
            OnboardingView()
                .transition(Self.onboardingTransition)
        }
    }

    @MainActor
    func saveUser(user: User) {
        withAnimation {
            userContext.saveUser(user)
        }
    }

    @MainActor
    func logout() {
        withAnimation {
            userContext.resetUser()
        }
    }
}

#Preview {
    ContentView()
        .environment(UserContext.sampleContextNotRegistered)
}
