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
            HeroView()
            Form {
                Section("Let us know you") {
                    UserDataView(user: $user)
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
    }
}

#Preview {
    OnboardingView()
        .environment(UserContext.sampleContextNotRegistered)
}
