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

    var body: some View {
        if userContext.isUserRegistered {
            TabView {
                FilterableMenuView().tabItem { Label("Menu", systemImage: "list.bullet.rectangle") }
                ProfileView(user: userContext.user!, onChange: saveUser, onLogout: logout).tabItem { Label("Profile", systemImage: "person.circle") }
            }
        } else {
            OnboardingView()
        }
    }

    func saveUser(user: User) {
        Task {
            await userContext.saveUser(user)
        }
    }

    @MainActor
    func logout() {
        userContext.resetUser()
    }
}

#Preview {
    ContentView()
        .environment(UserContext.sampleContextNotRegistered)
}
