//
// MenuUtils.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 05/04/2024. 

import Foundation
import os

class MenuUtils {

    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: UserContext.self)
    )

    static func convertToMenuItems(entries: [MenuEntry]) -> [MenuItem] {
        var result = Array<MenuItem>();
        entries.forEach {
            if let item = convertToMenuItem(entry: $0) {
                result.append(item)
            }
        }
        return result
    }

    static func convertToMenuItem(entry: MenuEntry) -> MenuItem? {
        guard let price = Double(entry.price) else {
            logger.error("Failed to convert price to Double for menu entry (id: \(entry.id), title: \(entry.title)). The entry will be skipped.")
            return nil
        }
        return MenuItem(id: entry.id, title: entry.title, about: entry.description, price: price, image: entry.image, category: entry.category)
    }

    static func getImageSaveURL(for menuEntry: MenuEntry) -> URL {
        let fileName = "\(menuEntry.id).jpg"
        let result = FileManager.documentsDirectory.appendingPathComponent(fileName)
        logger.trace("Image save path: \(result)")
        return result
    }
}
