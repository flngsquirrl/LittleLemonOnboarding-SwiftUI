//
//  HomeView.swift
//  LittleLemonOnboarding
//
//  Created by flngsquirrl on 02/04/2024.
//

import SwiftData
import SwiftUI

struct MenuView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [Self.sortDescriptor]) var menuItems: [MenuItem]

    private static var sortDescriptor = SortDescriptor(\MenuItem.title, comparator: .localizedStandard)

    init(filter: Filter) {
        let titleFilter = filter.title
        let categoriesFilter = filter.categories.map{ $0.rawValue }

        var filterDescriptor: Predicate<MenuItem>? = nil
        if !titleFilter.isEmpty || !categoriesFilter.isEmpty {
            filterDescriptor = #Predicate<MenuItem> { item in
                if !titleFilter.isEmpty && !categoriesFilter.isEmpty {
                    return item.title.localizedStandardContains(titleFilter)
                    && categoriesFilter.contains(item.category)
                } else if categoriesFilter.isEmpty {
                    return item.title.localizedStandardContains(titleFilter)
                } else {
                    return categoriesFilter.contains(item.category)
                }
            }
            _menuItems = Query(filter: filterDescriptor, sort: [Self.sortDescriptor])
        }
    }

    var body: some View {
        MenuListView(menuItems: menuItems)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: MenuItem.self, configurations: config)
        container.mainContext.insert(MenuItem.greekSalad)
        container.mainContext.insert(MenuItem.lemonDessert)
        return MenuView(filter: Filter.sampleFilterLemonDesserts)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
