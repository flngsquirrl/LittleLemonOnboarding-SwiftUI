//
//  ProfileView.swift
//  LittleLemonOnboarding
//
//  Created by flngsquirrl on 02/04/2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(UserContext.self) private var userContext
    
    var body: some View {
        if userContext.isUserRegistered {
            Form {
                Text("User: \(userContext.user!.firstName)");
                Button("Change name") {
                    userContext.user = User.sampleAnna
                }
                Button("Logout") {
                    userContext.resetUser()
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environment(UserContext.sampleContextRegistered)
}
