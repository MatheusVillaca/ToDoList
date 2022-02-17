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
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
