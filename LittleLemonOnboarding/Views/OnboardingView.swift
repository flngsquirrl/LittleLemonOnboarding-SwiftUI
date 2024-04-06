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

    var body: some View {
        VStack(spacing: 0) {
            Text("Little Lemon")
                .font(.title)
            Form {
                Section("Let us know you") {
                    TextField("First name", text: $user.firstName)
                    TextField("Last name", text: $user.lastName)
                    TextField("Email", text: $user.email)
                        .keyboardType(.emailAddress)
                }
                Button("Register") {
                    Task {
                        await userContext.saveUser(user)
                    }
                }
                .disabled(!UserUtils.isUserDataValid(user))
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    OnboardingView()
        .environment(UserContext.sampleContextNotRegistered)
}
