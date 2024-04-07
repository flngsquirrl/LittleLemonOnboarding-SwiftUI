//
// Hero.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 07/04/2024. 

import Foundation

struct Hero {
    var title: String
    var city: String
    var about: String
    var imageResource: String
}

extension Hero {
    static let littleLemon = Hero(title: "Little Lemon", city: "Chicago", about: "We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.", imageResource: "hero")
}
