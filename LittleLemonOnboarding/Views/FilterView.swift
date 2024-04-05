//
// FilterView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import SwiftUI

struct FilterView: View {
    @Binding var filter: Filter

    var body: some View {
        TextField("Search...", text: $filter.title.animation())
    }
}

#Preview {
    FilterView(filter: .constant(Filter.sampleFilterLemonDesserts))
}
