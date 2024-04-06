//
//  LittleLemonOnboardingApp.swift
//  LittleLemonOnboarding
//
//  Created by flngsquirrl on 02/04/2024.
//

import SwiftUI
import SwiftData

@main
struct LittleLemonOnboardingApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            MenuItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            SplashView()
        }
        .modelContainer(sharedModelContainer)
        .environment(UserContext())
    }
}
