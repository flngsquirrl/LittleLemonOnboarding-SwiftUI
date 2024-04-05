//
// MenuItemView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import SwiftUI

struct MenuItemView: View {
    var menuItem: MenuItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(menuItem.title)
                    .fontWeight(.bold)
                Text(menuItem.about)
                Text(String(menuItem.price))
                Text(menuItem.category)
            }
            Spacer()
            Image(systemName: "carrot")
                .dynamicTypeSize(.xxxLarge)
        }
    }
}

#Preview {
    MenuItemView(menuItem: MenuItem.greekSalad)
}
