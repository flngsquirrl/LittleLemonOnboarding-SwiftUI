//
// MenuUtils.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import Foundation

class MenuUtils {

    static func convertToMenuItems(entries: [MenuEntry]) -> [MenuItem] {
        var result = Array<MenuItem>();
        entries.forEach{ result.append(convertToMenuItem(entry: $0))}
        return result
    }

    static func convertToMenuItem(entry: MenuEntry) -> MenuItem {
        return MenuItem(id: entry.id, title: entry.title, about: entry.description, price: entry.price, image: entry.image, category: entry.category)
    }

}
