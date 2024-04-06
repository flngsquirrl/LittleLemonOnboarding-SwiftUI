//
// View-Header.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 06/04/2024. 

import SwiftUI

struct Header: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        NavigationStack {
            content
                .navigationTitle(text)
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(
                    Color.lime,
                    for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(.light, for: .navigationBar)
        }
    }
}

extension View {
    func withHeader(title: String) -> some View {
        modifier(Header(text: title))
    }
}

#Preview {
    Text("Test")
        .withHeader(title: "Test header")
}
