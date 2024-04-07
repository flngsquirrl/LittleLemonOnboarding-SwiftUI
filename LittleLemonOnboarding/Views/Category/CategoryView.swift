//
// CategoryView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 07/04/2024. 

import SwiftUI

struct CategoryView: View {
    @Binding var categoryItem: CategoryItem
    private var onChange: () -> Void

    init(categoryItem: Binding<CategoryItem>, onChange: @escaping () -> Void) {
        _categoryItem = categoryItem
        self.onChange = onChange
    }

    var body: some View {
        Text(categoryItem.name)
            .foregroundStyle(.white)
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 7).fill(
                Color.warmOrange.opacity(categoryItem.isActive ? 1 : 0))
                .stroke(categoryItem.isActive ? Color.warmOrange : Color.white))
            .onTapGesture {
                categoryItem.isActive.toggle()
                onChange()
            }
    }
}

#Preview {
    struct PreviewContainerView : View {
        @State var categoryItem: CategoryItem

       var body: some View {
           CategoryView(categoryItem: $categoryItem, onChange: {})
       }
    }

    return HStack {
        PreviewContainerView(categoryItem: CategoryItem.sampleMainActive)
        PreviewContainerView(categoryItem: CategoryItem.sampleDessertsInactive)
    }
    .padding()
    .background(Color.darkGreen)
}
