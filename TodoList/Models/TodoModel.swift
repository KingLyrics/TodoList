//
//  TodoModel.swift
//  TodoList
//
//  Created by Ekomobong Edeme on 18/03/2024.
//

import Foundation

struct TodoModel:Identifiable, Codable{
    let id:String
    let title:String
    let isCompleted:Bool
    
    
    init(id:String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    
    
    func updateCompletion()-> TodoModel{
        return TodoModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
