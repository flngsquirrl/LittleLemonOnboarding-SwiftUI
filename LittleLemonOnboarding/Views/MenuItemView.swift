//
// MenuItemView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import SwiftUI

struct MenuItemView: View {
    var menuItem: MenuItem

    var body: some View {
        GeometryReader { metrics in
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
                    .resizable()
                    .scaledToFit()
                    .frame(width: metrics.size.width * 0.2)
            }
        }
    }
}

#Preview {
    MenuItemView(menuItem: MenuItem.greekSalad)
        .background(Color.blue)
        .frame(height: 100)
}
