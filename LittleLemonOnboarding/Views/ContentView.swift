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
        if !userContext.isLoaded {
            SplashView()
        } else if userContext.isUserRegistered {
            TabView {
                FilterableMenuView().tabItem { Label("Menu", systemImage: "list.bullet.rectangle") }
                ProfileView().tabItem { Label("Profile", systemImage: "person.circle") }
            }
        } else {
            OnboardingView()
        }
    }
}

#Preview {
    ContentView()
        .environment(UserContext.sampleContextNotRegistered)
}
