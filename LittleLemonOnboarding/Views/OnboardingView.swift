//
//  OnboardingView.swift
//  LittleLemonOnboarding
//
//  Created by flngsquirrl on 02/04/2024.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(UserContext.self) private var userContext

    @State private var user: User = User.emptyUser

    var test: Double = 45

    var body: some View {
        VStack(spacing: 0) {
            HeroView()
            Form {
                Section {
                    UserDataView(user: $user)
                } footer: {
                    Text("Please, enter your personal information and register to see the menu")
                }
                Button("Register") {
                    withAnimation {
                        userContext.saveUser(user)
                    }
                }
                .disabled(!UserUtils.isUserDataValid(user))
                .frame(maxWidth: .infinity)
            }
        }
        .withHeader(title: "Welcome")
    }
}

#Preview {
    OnboardingView()
        .environment(UserContext.sampleContextNotRegistered)
}
