//
// NetworkService.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import Foundation

struct NetworkService {

    static let menuUri = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json";

    func getMenu() async -> [MenuEntry] {
        // TODO: fetch data from uri
        return MenuEntry.sampleEntries;
    }

}
