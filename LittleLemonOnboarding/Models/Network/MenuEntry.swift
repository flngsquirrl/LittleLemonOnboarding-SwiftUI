//
// MenuEntry.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import Foundation

struct MenuEntry: Codable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}

#if DEBUG
extension MenuEntry {
    static let sampleEntries = [
        greekSalad,
        lemonDessert,
    ]

    static let greekSalad = MenuEntry(id: 1, title: "Greek Salad", description: "The famous greek salad of crispy lettuce.", price: "10", image: "", category: "starters")
    static let lemonDessert = MenuEntry(id: 2, title: "Lemon Dessert", description: "Traditional homemade Italian Lemon Ricotta Cake.", price: "20", image: "", category: "desserts")
}
#endif
