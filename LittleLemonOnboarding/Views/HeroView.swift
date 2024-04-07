//
// HeroView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 06/04/2024. 

import SwiftUI

struct HeroView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(Hero.littleLemon.title)
                .foregroundColor(.lime)
                .font(.heroTitle)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(Hero.littleLemon.city)
                        .font(.heroCity)
                        .foregroundColor(.white)
                        .offset(y: -20)
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
        }
        .padding([.bottom, .leading, .trailing])
        .background(Color.darkGreen)
    }
}

#Preview {
    HeroView()
}
