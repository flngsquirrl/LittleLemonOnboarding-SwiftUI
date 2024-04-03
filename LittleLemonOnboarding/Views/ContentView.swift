//
//  ContentView.swift
//  LittleLemonOnboarding
//
//  Created by flngsquirrl on 02/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [MenuItem]

    var body: some View {
        TabView {
            MenuView().tabItem { Label("Menu", systemImage: "list.bullet.rectangle") }
            ProfileView().tabItem { Label("Profile", systemImage: "person.circle") }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: MenuItem.self, inMemory: true)
}
