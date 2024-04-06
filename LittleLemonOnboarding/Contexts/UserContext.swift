//
// UserContext.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 03/04/2024. 

import Foundation
import SwiftUI
import os

@MainActor
@Observable
class UserContext {

    var user: User?

    var isUserRegistered: Bool {
        user != nil
    }

    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: UserContext.self)
    )

    func loadUser() async {
        if let savedUser = UserDefaults.standard.data(forKey: User.storageKey) {
            let decoder = JSONDecoder()
            do {
                user = try decoder.decode(User.self, from: savedUser)
            } catch {
                Self.logger.error("Failed to load user from storage")
            }
        }
    }

    func registerUser(_ user: User) async {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: User.storageKey)
            withAnimation {
                self.user = user
            }
        } else {
            Self.logger.error("Failed to encode user before saving")
        }
    }

    func resetUser() {
        self.user = nil
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
