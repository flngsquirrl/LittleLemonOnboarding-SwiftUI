//
// MenuListView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import SwiftUI

struct MenuListView: View {

    var menuItems: [MenuItem]

    var body: some View {
        List(menuItems, id: \.id) { item in
            MenuItemView(menuItem: item)

        }
        .listStyle(.plain)
    }
}

#Preview {
    MenuListView(menuItems: MenuItem.sampleEntries)
}
