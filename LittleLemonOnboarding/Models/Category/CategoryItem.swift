//
// CategoryItem.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 07/04/2024. 

import Foundation

struct CategoryItem {
    let category: MenuCategory
    var isActive: Bool = false

    var name: String {
        category.rawValue
    }
}

extension CategoryItem {
    static let allCategories = MenuCategory.allCases.map { CategoryItem(category: $0) }
}

#if DEBUG
extension CategoryItem {
    static let sampleMainActive = CategoryItem(category: .mains)
    static let sampleDessertsInactive = CategoryItem(category: .desserts, isActive: true)
}
#endif
