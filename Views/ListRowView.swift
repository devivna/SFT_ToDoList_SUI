//
//  ListRowView.swift
//  ToDoList
//
//  Created by Надія on 12.12.2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel

    var body: some View {
        HStack {
            Image(systemName: item.isComplited ? "checkmark.circle" : "circle")
                .foregroundColor(item.isComplited ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding()
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "Item 1", isComplited: false)
    static var item2 = ItemModel(title: "Item 2", isComplited: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
