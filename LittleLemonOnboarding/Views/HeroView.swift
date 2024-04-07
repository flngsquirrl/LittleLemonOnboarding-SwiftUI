//
// HeroView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 06/04/2024. 

import SwiftUI

struct HeroView: View {

    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(Hero.littleLemon.title)
                    .foregroundColor(.lime)
                    .font(.largeTitle)
                Text(Hero.littleLemon.city)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.bottom)
                Text(Hero.littleLemon.about)
                    .font(.callout)
                    .foregroundColor(.white)
                    .lineLimit(5, reservesSpace: true)
            }
            Spacer()
            Image(Hero.littleLemon.imageResource)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Rectangle())
                .cornerRadius(10)
        }
        .padding()
        .background(Color.darkGreen)
    }
}

#Preview {
    HeroView()
}
