//
// HeroView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 06/04/2024. 

import SwiftUI

struct HeroView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Little Lemon")
                    .foregroundColor(.lime)
                    .font(.largeTitle)
                Text("We are a family owned Mediterranean restaurant")
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.darkGreen)
    }
}

#Preview {
    HeroView()
}
