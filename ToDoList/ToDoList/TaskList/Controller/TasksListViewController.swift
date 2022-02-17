//
//  TasksListViewController.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

final class TasksListViewController: UIViewController, UITableViewDataSource, CreateTaskViewDelegate {
    
    var tasks: [Task] = []
    
    lazy var listView: TaskListView = .init(dataSource: self, addAction: {
        self.presentAddTaskScreen()
    })
    
    override func loadView() {
        view = listView
    }
    
    func presentAddTaskScreen() {
        present(CreateTaskViewController(delegate: self), animated: true, completion: nil)
    }
    
    func createTask(title: String, description: String) {
        let task: Task = .init(title: title, description: description)
        presentedViewController?.dismiss(animated: true, completion: nil)
        tasks.append(task)
        listView.tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task: Task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
}
