//
//  Task.swift
//  ToDoList
//
//  Created by Matheus Villaça on 16/02/22.
//

import Foundation

final class Task: Codable {
    
    let title: String
    let description: String
    var isDone: Bool
    
    init(title: String, description: String, isDone: Bool = false) {
        self.title = title
        self.description = description
        self.isDone = isDone
    }
}
