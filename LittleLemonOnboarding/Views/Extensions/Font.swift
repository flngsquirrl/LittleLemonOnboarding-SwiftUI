//
// Font.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 07/04/2024. 

import Foundation
import SwiftUI

extension Font {
    static let heroTitle = Self.custom("MarkaziText-Regular", size: 55)
    static let heroCity = Self.custom("Karla-Regular", size: 30)
}

#Preview {
    VStack {
        Text("Little Lemon")
            .font(.heroTitle)
        Text("Chicago")
            .font(.heroCity)
    }
}
