//
//  HomeView.swift
//  LittleLemonOnboarding
//
//  Created by flngsquirrl on 02/04/2024.
//

import SwiftUI

struct MenuView: View {
    @Environment(UserContext.self) private var userContext

    var body: some View {
        if userContext.isUserRegistered {
            Text("User: \(userContext.user!.firstName)");
        }
    }
}

#Preview {
    MenuView()
        .environment(UserContext.sampleContextRegistered)
}
