//
// UserContext.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 03/04/2024. 

import Foundation
import SwiftUI

@MainActor
@Observable
class UserContext {

    var user: User?
    var isLoaded: Bool = false

    var isUserRegistered: Bool {
        user != nil
    }

    func loadUser() async {
        //TODO: read from UserDefaults
        withAnimation {
            isLoaded = true
        }
    }

    func registerUser(_ user: User) async {
        //TODO: save to UserDefaults
        withAnimation {
            self.user = user
        }
    }

    func reset() {
        withAnimation {
            self.user = nil
        }
    }
}

#if DEBUG
extension UserContext {

    convenience init(user: User) {
        self.init()
        self.user = user
    }

    static let sampleContextRegistered = UserContext(user: User.sampleJulia)
    static let sampleContextNotRegistered = UserContext()
}
#endif
