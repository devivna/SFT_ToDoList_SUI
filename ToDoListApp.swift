//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Надія on 12.12.2022.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
   @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView { // all views will be in the Navigation view
                ListView()
                    .environmentObject(listViewModel)
            }
        }
    }
}
