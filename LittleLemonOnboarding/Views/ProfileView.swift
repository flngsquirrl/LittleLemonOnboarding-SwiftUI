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
                    .disabled(!hasChanges())
                    Button("Reset changes", role: .cancel) {
                        user = initialUser
                    }
                    .disabled(!hasChanges())
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

    func hasChanges() -> Bool {
        return !String.areEqual(user.firstName, initialUser.firstName)
        || !String.areEqual(user.lastName, initialUser.lastName)
        || !String.areEqual(user.email, initialUser.email)
    }
}

#Preview {
    ProfileView(user: User.sampleAnna, onChange: { _ in }, onLogout: {})
}
