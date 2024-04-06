//
// FilterableMenuView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import SwiftData
import SwiftUI

struct FilterableMenuView: View {
    @Environment(\.modelContext) var modelContext

    @State private var filter: Filter = Filter()
    @State private var isLoaded = false

    var body: some View {
        VStack {
            HeroView()
            FilterView(filter: $filter)
                .disabled(!isLoaded)
            if isLoaded {
                MenuView(filter: filter)
            } else {
                ProgressView()
            }
        }
        .withHeader(title: "Menu")
        .onAppear() {
            Task {
                //try? modelContext.delete(model: MenuItem.self)
                let count = (try? modelContext.fetchCount(FetchDescriptor<MenuItem>())) ?? 0
                if count == 0 {
                    await loadMenuItems()
                }
                isLoaded = true
            }
        }
    }

    private func loadMenuItems() async {
        let entries = await NetworkService().getMenu();
        let items = MenuUtils.convertToMenuItems(entries: entries)
        items.forEach { modelContext.insert($0) }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: MenuItem.self, configurations: config)
        return FilterableMenuView()
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
