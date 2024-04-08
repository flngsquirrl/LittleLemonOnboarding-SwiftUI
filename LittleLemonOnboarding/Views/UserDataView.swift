//
// UserDataView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 06/04/2024. 

import SwiftUI

struct UserDataView: View {

    @Binding var user: User

    var body: some View {
        TextField("First name", text: $user.firstName.animation())
            .autocorrectionDisabled()
        TextField("Last name", text: $user.lastName.animation())
            .autocorrectionDisabled()
        TextField("Email", text: $user.email.animation())
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
    }
}

#Preview {
    UserDataView(user: .constant(User.sampleJulia))
}
