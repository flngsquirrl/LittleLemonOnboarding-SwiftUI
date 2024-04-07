//
// CategoriesView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 07/04/2024. 

import SwiftUI

struct CategoriesView: View {
    @Binding var categoryItems: [CategoryItem]
    private var onChange: () -> Void

    init(categoryItems: Binding<[CategoryItem]>, onChange: @escaping () -> Void) {
        _categoryItems = categoryItems
        self.onChange = onChange
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                HStack {
                    ForEach($categoryItems, id: \.name) { $item in
                        CategoryView(categoryItem: $item, onChange: onChange)
                    }
                }
            }
            .padding(2)
        }
    }
}

#Preview {
    CategoriesView(categoryItems: .constant(CategoryItem.allCategories), onChange: {})
}
