//
//  TodoListApp.swift
//  TodoList
//
//  Created by Ekomobong Edeme on 18/03/2024.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var todoViewModel = TodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(todoViewModel)
        }
    }
}
