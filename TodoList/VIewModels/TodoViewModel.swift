//
//  TodoViewModel.swift
//  TodoList
//
//  Created by Ekomobong Edeme on 18/03/2024.
//

import Foundation


class TodoViewModel:ObservableObject {
    @Published var todoItems:[TodoModel]=[]{
        didSet{
            saveTodos()
        }
    }
    
    
    let TodoKey:String = "todo_key"
    
    
    init() {
        getTodos()
    }
    
    func getTodos(){
        guard 
            let data = UserDefaults.standard.data(forKey: TodoKey),
            let savedTodo = try?JSONDecoder().decode([TodoModel].self, from: data)
        else{ return }
        
        self.todoItems = savedTodo
        
        
    }
    
    func deleteTodo(indexSet:IndexSet){
        todoItems.remove(atOffsets: indexSet)
    }
    
    func moveTodo(from:IndexSet, to:Int){
        todoItems.move(fromOffsets: from, toOffset: to)
    }
    
    
    func updateTodo(todo:TodoModel){
        if let index = todoItems.firstIndex(where: {$0.id == todo.id}){
            todoItems[index] = todo.updateCompletion()
        }
    }
    
    func saveTodos(){
        if let encodedData = try? JSONEncoder().encode(todoItems){
            UserDefaults.standard.setValue(encodedData, forKey:TodoKey )
        }
    }
}
       


