//
//  ItemModel.swift
//  ToDoList
//
//  Created by Надія on 12.12.2022.
//

import Foundation

// Codable - we can decode and encode these items, we can transform the item model into data and out of data

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isComplited: Bool
    
    init(id: String = UUID().uuidString, title: String, isComplited: Bool) {
        self.id = id
        self.title = title
        self.isComplited = isComplited
    }
    
    func updateComplition() -> ItemModel {
        return ItemModel(id: id, title: title, isComplited: !isComplited)
    }
}
