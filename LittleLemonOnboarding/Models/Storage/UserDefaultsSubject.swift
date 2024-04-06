//
// UserDefaultsSubject.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 06/04/2024. 

import Foundation

protocol UserDefaultsSubject: Codable {
    static var storageKey: String {get}
}
