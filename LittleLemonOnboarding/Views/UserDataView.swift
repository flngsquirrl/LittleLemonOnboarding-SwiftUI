//
// UserDataView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 06/04/2024. 

import SwiftUI

struct UserDataView: View {

    @Binding var user: User

    var body: some View {
        TextField("First name", text: $user.firstName)
            .autocorrectionDisabled()
        TextField("Last name", text: $user.lastName)
            .autocorrectionDisabled()
        TextField("Email", text: $user.email)
            .keyboardType(.emailAddress)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
}

#Preview {
    UserDataView(user: .constant(User.sampleJulia))
}
