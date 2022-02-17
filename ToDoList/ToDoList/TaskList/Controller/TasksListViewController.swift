//
//  TasksListViewController.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

final class TasksListViewController: UIViewController, UITableViewDataSource, CreateTaskViewDelegate, UITableViewDelegate {
    
    var tasks: [Task] = []
    
    init(savedTasks: [Task]) {
        self.tasks = savedTasks
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var listView: TaskListView = .init(tableViewDelegate: self, dataSource: self, addAction: {
        self.presentAddTaskScreen()
    })
    
    override func loadView() {
        view = listView
    }
    
    func presentAddTaskScreen() {
        present(CreateTaskViewController(delegate: self), animated: true, completion: nil)
    }
    
    func createTask(title: String?, description: String) {
        let task: Task = .init(title: title ?? "", description: description)
        tasks.append(task)
        presentedViewController?.dismiss(animated: true, completion: nil)
        listView.tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TaskListViewCell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskListViewCell else {
            return UITableViewCell()
        }
        let task: Task = tasks[indexPath.row]
//        cell.accessoryType = .disclosureIndicator
        cell.setupCell(titleTask: task.title, descriptionTask: task.description )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell: TaskListViewCell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskListViewCell else {
            return
        }
        cell.toggle()
    }
}

