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
        VStack(spacing: 0) {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
                .fontWeight(.thin)
            Form {
                Section {
                    UserDataView(user: $user)
                }
                Section {
                    Button("Save changes") {
                        onChange(user)
                    }
                    Button("Reset changes", role: .cancel) {
                        user = initialUser
                    }
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(role: .destructive) {
                    onLogout()
                } label: {
                    Label("Logout", systemImage: "rectangle.portrait.and.arrow.forward")
                }
            }
        }
        .withHeader(title: "Profile")
    }
}

#Preview {
    ProfileView(user: User.sampleAnna, onChange: { _ in }, onLogout: {})
}
