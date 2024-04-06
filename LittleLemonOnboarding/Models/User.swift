//
// UserData.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 03/04/2024. 

import Foundation
import SwiftUI

struct User {
    var firstName: String
    var lastName: String
    var email: String
}

extension User: UserDefaultsSubject {
    static var storageKey = "user"
}

extension User {
    static let emptyUser = User(firstName: "", lastName: "", email: "")
}

#if DEBUG
extension User {
    static let sampleJulia = User(firstName: "Julia", lastName: "Squirrel", email: "squirrel@swift.ui")
    static let sampleAnna = User(firstName: "Anna", lastName: "Squirrel", email: "squirrel@swift.ui")
}
#endif
