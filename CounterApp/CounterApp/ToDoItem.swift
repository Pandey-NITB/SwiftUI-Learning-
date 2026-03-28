//
//  ToDoItem.swift
//  CounterApp
//
//  Created by Prashant Pandey on 28/03/26.
//

import Foundation

struct TodoItem: Identifiable {
    let id: UUID
    var title: String
    var isComplete: Bool
    
    init(title: String) {
        self.id = UUID()
        self.title = title
        self.isComplete = false
    }
}
