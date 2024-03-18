//
//  AddView.swift
//  TodoList
//
//  Created by Ekomobong Edeme on 18/03/2024.
//

import SwiftUI

struct AddView: View {
    @State var textFieldInput:String = ""
    
    @EnvironmentObject var todoViewModel:TodoViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var alertTitle = ""
    @State var alertIshowing = false


    var body: some View {
        ScrollView{
            TextField("Type something here", text:$textFieldInput )
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 10))
                .padding()
            
            Button(action: {
                addTodo(title: textFieldInput)
                textFieldInput = ""
            }, label: {
                Text("Save")
                    .font(.title3)
                    .frame(width: 250)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.tint)
                    .clipShape(.rect(cornerRadius: 10))
            })
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $alertIshowing, content: getAlert)
    }
    
    func isAppropriate(title:String)->Bool{
        if title.count < 3{
            alertTitle = "Your new Todo Item must be at least 3 characters long."
            alertIshowing.toggle()
            return false
        }
        return true
    }
    
    func addTodo(title:String, isCompleted:Bool = false){
        if isAppropriate(title: title){
            let newTodo = TodoModel(title: title, isCompleted:isCompleted )
            todoViewModel.todoItems.append(newTodo)
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func getAlert()->Alert{
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
    .environmentObject(TodoViewModel())
    
}
