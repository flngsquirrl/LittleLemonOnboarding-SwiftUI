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
                    .font(.headline)
                    .padding(.bottom)
                Text(menuItem.about)
                    .lineLimit(2)
                    .font(.callout)
                    .padding([.bottom, .trailing])
                Text(formatPrice(menuItem.price))
            }
            Spacer()
            Image(menuItem: menuItem)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(10)

        }
    }

    private func formatPrice(_ price: Double) -> String {
        "$" + String(format: "%.2f", price)
    }
}

#Preview {
    MenuItemView(menuItem: MenuItem.greekSalad)
        .background(Color.blue)
}
