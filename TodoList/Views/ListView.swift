//
//  ListView.swift
//  TodoList
//
//  Created by Ekomobong Edeme on 18/03/2024.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject  var todoViewModel: TodoViewModel
    var body: some View {
        List{
            ForEach(todoViewModel.todoItems){todo in
                ListRowView(todo: todo)
                    .onTapGesture {
                        withAnimation(.linear){
                            todoViewModel.updateTodo(todo: todo)
                        }
                    }
            }
            .onDelete(perform: todoViewModel.deleteTodo)
            .onMove(perform: todoViewModel.moveTodo)
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝 ")
        .toolbar{
            ToolbarItem(placement:.topBarLeading){
               EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: AddView()) {
                    Text("Add")
                }
            }
        }
       
    }
   
}

#Preview {
    NavigationStack{
        ListView()
    }
    .environmentObject(TodoViewModel())

}

