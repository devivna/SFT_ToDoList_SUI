//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Students on 17.12.2022.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate = false
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(20)
                NavigationLink(destination: AddView()) {
                    Text("Add new item 🐌")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(animate ? .red : .blue)
                        .cornerRadius(10)
                }
                .padding()
                .padding(.top, 30)
                
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? Color.red.opacity(0.7) : Color.blue.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                
            }
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 ) {
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
        
    }
}
