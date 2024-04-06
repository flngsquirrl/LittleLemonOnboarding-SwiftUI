//
//  MenuItem.swift
//  LittleLemonOnboarding
//
//  Created by flngsquirrl on 03/04/2024.
//

import Foundation
import SwiftData

@Model
class MenuItem {

    let id: Int
    let title: String
    let about: String
    let price: Double
    let image: String
    let category: String

    init(id: Int, title: String, about: String, price: Double, image: String, category: String) {
        self.id = id
        self.title = title
        self.about = about
        self.price = price
        self.image = image
        self.category = category
    }
}

#if DEBUG
extension MenuItem {
    static let sampleEntries = [
        greekSalad,
        lemonDessert,
    ]

    static let greekSalad = MenuUtils.convertToMenuItem(entry: MenuEntry.greekSalad)!
    static let lemonDessert = MenuUtils.convertToMenuItem(entry: MenuEntry.lemonDessert)!
}
#endif
