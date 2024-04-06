//
// NetworkService.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import Foundation
import os

struct NetworkService {

    static let menuUri = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json";

    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: UserContext.self)
    )

    func getMenu() async -> [MenuEntry] {
        do {
            let url = URL(string: NetworkService.menuUri)!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(MenuEntries.self, from: data)
            return decodedResponse.menu
        } catch {
            NetworkService.logger.error("Failed to get menu from the endpoint: \(error)")
        }

        return []
    }

}
