//
// SwiftUIView.swift
// LittleLemonOnboarding
//
// Created by flngsquirrl on 07/04/2024. 

import SwiftUI

extension Image {
    
    static let blackImageIds = [2, 3]

    init(menuItem: MenuItem) {
        let imagePath = FileManager.documentsDirectory.appendingPathComponent("\(menuItem.id).jpg")
        if Self.blackImageIds.contains(menuItem.id) {
            self.init(resource: "\(menuItem.id)", ofType: "jpg")
        } else {
            self.init(uiImage: UIImage(contentsOfFile: imagePath.path()) ?? UIImage(systemName: "photo")!)
        }
    }

    init(resource name: String, ofType type: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: type),
              let image = UIImage(contentsOfFile: path) else {
            self.init(systemName: "fork.knife")
            return
        }
        self.init(uiImage: image)
    }
}

#Preview {
    Image(resource: "22", ofType: "jpg")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 100, height: 100)
}
