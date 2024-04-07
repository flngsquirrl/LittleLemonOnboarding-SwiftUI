//
// String.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 06/04/2024. 

import Foundation

extension String {

    private static let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
    private static let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)

    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func isEmail() -> Bool {
        return Self.emailValidationPredicate.evaluate(with: self)
    }

    func isNotEmpty() -> Bool {
        return !self.trim().isEmpty
    }

    static func areEqual(_ string1: String, _ string2: String) -> Bool {
        return string1.trim() == string2.trim()
    }
}
