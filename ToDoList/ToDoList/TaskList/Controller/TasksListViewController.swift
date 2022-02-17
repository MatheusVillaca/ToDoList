//
//  TasksListViewController.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

final class TasksListViewController: UIViewController, UITableViewDataSource, CreateTaskViewDelegate {
    
    let defaults = UserDefaults.standard
    var tasks: [Task] = []
    
    lazy var listView: TaskListView = .init(dataSource: self, addAction: {
        self.presentAddTaskScreen()
    })
    
    override func loadView() {
        view = listView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.array(forKey: "savedTasks")
        listView.tableView.reloadData()
    }
    
    func presentAddTaskScreen() {
        present(CreateTaskViewController(delegate: self), animated: true, completion: nil)
    }
    
    func createTask(title: String?, description: String) {
        let task: Task = .init(title: title ?? "", description: description)
        presentedViewController?.dismiss(animated: true, completion: nil)
        tasks.append(task)
        listView.tableView.reloadData()
    }
    
    func valueDefaults() {
        defaults.set(tasks, forKey: "savedTasks")
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
}

