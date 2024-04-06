//
//  ProfileView.swift
//  LittleLemonOnboarding
//
//  Created by flngsquirrl on 02/04/2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var user = User.emptyUser

    private var initialUser: User
    private var onChange: (User) -> Void
    private var onLogout: () -> Void

    init(user: User, onChange: @escaping (User) -> Void, onLogout: @escaping () -> Void) {
        _user = State(initialValue: user)
        self.initialUser = user
        self.onChange = onChange
        self.onLogout = onLogout
    }

    var body: some View {
        Form {
            UserDataView(user: $user)
            Button("Save changes") {
                onChange(user)
            }
            Button("Reset changes") {
                user = initialUser
            }
            Button("Logout") {
                onLogout()
            }
        }
        .withHeader(title: "Profile")
    }
}

#Preview {
    ProfileView(user: User.sampleAnna, onChange: { _ in }, onLogout: {})
}
