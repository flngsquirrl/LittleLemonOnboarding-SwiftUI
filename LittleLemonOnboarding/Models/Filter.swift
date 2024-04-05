//
// Filter.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import Foundation

struct Filter {
    var title: String
    var categories: [MenuCategory]

    init(title: String = "", categories: [MenuCategory] = []) {
        self.title = title
        self.categories = categories
    }
}

#if DEBUG
extension Filter {
    static let sampleFilterSaladStarters = Filter(title: "salad", categories: [MenuCategory.starters])
    static let sampleFilterLemonDesserts = Filter(title: "lemon", categories: [MenuCategory.desserts])
}
#endif
