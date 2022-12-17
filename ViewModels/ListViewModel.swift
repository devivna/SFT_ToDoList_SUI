//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Надія on 12.12.2022.
//

import Foundation

/*
 AppStorage in View
 
 */

class ListViewModel: ObservableObject {
    //@State in struct = @Published in class
    @Published var items: [ItemModel] = [] {
        didSet {    // call every time when we change this array
            saveItems()
        }
    }
    
    
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "Cleaning", isComplited: true),
//            ItemModel(title: "Brushing", isComplited: true),
//            ItemModel(title: "Learning", isComplited: false)
//        ]
        
        //add array to another array
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(index:IndexSet) {
        items.remove(atOffsets: index)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isComplited: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateComplition()
        }
        
        //        if let index = items.firstIndex { (existingItem) -> Bool in
        //            return existingItem.id == item.id
        //        } {
        //            // true -> run this code
        //        }
        
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) { // convert into JSon data
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
