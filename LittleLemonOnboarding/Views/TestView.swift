//
// TestView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 07/04/2024. 

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            Color.blue
                .frame(height: 300)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1..<50) { value in
                        Text(String(value))
                    }
                }
            }
            List(1..<20) { value in
                Text(String(value))
            }
        }
        .withHeader(title: "Menu")
    }
}

#Preview {
    TabView {
        TestView().tabItem { Label("Profile", systemImage: "person.circle") }
    }
}
