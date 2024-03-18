//
//  ListRowView.swift
//  TodoList
//
//  Created by Ekomobong Edeme on 18/03/2024.
//

import SwiftUI

struct ListRowView: View {
    let todo:TodoModel
    
    var body: some View {
        HStack{
            Image(systemName: todo.isCompleted ? "checkmark.circle" :  "circle")
                .foregroundStyle(todo.isCompleted ? .green : .red)
            Text(todo.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


#Preview {
    ListRowView(todo: TodoModel(title: "Run", isCompleted: true))
}
