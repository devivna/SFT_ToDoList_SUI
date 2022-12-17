//
//  AddView.swift
//  ToDoList
//
//  Created by Надія on 12.12.2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textField = ""
    
    @State var alertTitle = ""
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here", text: $textField)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button {
                    saveButtonPresed()
                } label: {
                    Text("Save" .uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(10)
                        .padding()
                        .shadow(radius: 10)
                }
            }
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPresed() {
        if textIsApropriate() {
            listViewModel.addItem(title: textField)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsApropriate() -> Bool {
        if textField.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters at long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
                    .preferredColorScheme(.light)
                    .environmentObject(ListViewModel())
            }
            NavigationView {
                AddView()
                    .preferredColorScheme(.dark)
                    .environmentObject(ListViewModel())
            }
        }
        
    }
}
