//
//  TasksListViewController.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

final class TasksListViewController: UIViewController {
    
    lazy var listView: TaskListView = .init(addAction: {
        self.presentAddTaskScreen()
    })
    
    override func loadView() {
        view = listView
    }
    
    func presentAddTaskScreen() {
        present(CreateTaskViewController(), animated: true, completion: nil)
    }
}
