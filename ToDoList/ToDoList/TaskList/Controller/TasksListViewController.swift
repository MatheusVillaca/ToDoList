//
//  TasksListViewController.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

final class TasksListViewController: UIViewController, CreateTaskViewDelegate, TaskListViewCellDelegate, UITableViewDelegate, UITableViewDataSource {
    
    enum Sections: Int, CaseIterable {
        case todo, done
        
        var title: String {
            switch self {
            case .done:
                return "Tasks Done"
            case .todo:
                return "To Do Tasks"
            }
        }
    }
    var tasks: [Task] = []
    var expandedIndexes: Set<IndexPath> = []
    
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
    func showAlert(title: String, message: String, style: UIAlertController.Style) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func createTask(title: String?, description: String) {
        let task: Task = .init(title: title ?? "", description: description)
        tasks.append(task)
        presentedViewController?.dismiss(animated: true, completion: nil)
        listView.tableView.reloadData()
    }
    
    func doneAction(index: Int) {
        let selectedTask: Task = tasks[index]
        selectedTask.isDone = true
        listView.tableView.reloadData()
    }
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let currentSection: Sections? = .init(rawValue: section)
        return currentSection?.title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let currentSection: Sections = Sections(rawValue: section) else { return 0 }
        switch currentSection {
        case Sections.todo:
            return tasks.filter({ !$0.isDone }).count
        default:
            return tasks.filter({ $0.isDone }).count
        }
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell: TaskListViewCell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskListViewCell else {
                return UITableViewCell()
            }
            if indexPath.section == 0 {
                let undoneTasks: [Task] = tasks.filter({ !$0.isDone })
                let task: Task = undoneTasks[indexPath.row]
                cell.setupCell(titleTask: task.title, descriptionTask: task.description, delegate: self, index: indexPath.row, isExpanded: expandedIndexes.contains(indexPath))
            } else {
                let doneTasks: [Task] = tasks.filter({ $0.isDone })
                let taskDone: Task = doneTasks[indexPath.row]
                cell.setupCell(titleTask: taskDone.title, descriptionTask: taskDone.description, delegate: self, index: indexPath.row, isExpanded: expandedIndexes.contains(indexPath))
            }
            cell.isUserInteractionEnabled = true
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if expandedIndexes.contains(indexPath) {
            expandedIndexes.remove(indexPath)
        } else {
            expandedIndexes.insert(indexPath)
        }
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }

}
