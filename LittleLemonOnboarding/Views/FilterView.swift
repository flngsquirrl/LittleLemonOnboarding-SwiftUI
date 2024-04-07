//
// FilterView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import SwiftUI

struct FilterView: View {
    @Binding var filter: Filter
    @State private var categories = CategoryItem.allCategories

    var body: some View {
        VStack {
            TextField("Search...", text: $filter.title.animation())
            CategoriesView(categoryItems: $categories, onChange: updateFilter)
        }
    }

    func updateFilter() {
        withAnimation {
            filter.categories = categories.filter { $0.isActive }
                .map { MenuCategory.init(rawValue: $0.name)! }
        }
    }
}

#Preview {
    FilterView(filter: .constant(Filter()))
}
