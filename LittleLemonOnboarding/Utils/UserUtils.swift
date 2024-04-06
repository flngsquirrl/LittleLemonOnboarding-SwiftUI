//
// UserUtils.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 06/04/2024. 

import Foundation

class UserUtils {

    static func isUserDataValid(_ user: User) -> Bool {
        return user.firstName.isNotEmpty() && user.lastName.isNotEmpty() && user.email.isEmail()
    }
}
