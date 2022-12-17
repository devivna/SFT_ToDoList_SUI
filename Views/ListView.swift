/*
 
 MVVM Architecture
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 */

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            // if type confirm to Identifible -> don't need \.self
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
            
        }
        .listStyle(.plain)
        .navigationTitle("ToDo List")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add",
                                               destination: AddView()
                                    .environmentObject(ListViewModel())
                                              ))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

