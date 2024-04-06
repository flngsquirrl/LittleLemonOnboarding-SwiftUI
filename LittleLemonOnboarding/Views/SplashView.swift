//
// SplashView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 03/04/2024. 

import SwiftUI

struct SplashView: View {
    @Environment(UserContext.self) private var userContext

    @State private var isLoading = true
    private static var onscreenTime: UInt64 = 1_000_000_000

    var body: some View {
        if isLoading {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .onAppear() {
                    Task {
                        try await Task.sleep(nanoseconds: SplashView.onscreenTime)
                        await userContext.loadUser()
                        withAnimation {
                            isLoading = false
                        }
                    }
                }
        } else {
            ContentView()
        }
    }
}

#Preview {
    SplashView()
        .environment(UserContext.sampleContextNotRegistered)
}
